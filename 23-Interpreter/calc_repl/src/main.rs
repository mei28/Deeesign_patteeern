use core::borrow::Borrow;
use std::io::{self, Write};
use std::mem;

fn main() {
    loop {
        print!(">> ");
        io::stdout().flush().unwrap();

        let mut code = String::new();
        io::stdin()
            .read_line(&mut code)
            .ok()
            .expect("failed to read line");

        if code == "exit\n" {
            break;
        }

        let lexer = Lexer::new(code.chars().collect());
        let mut parser = Parser::new(lexer);

        let expr = parser.parse();

        if let Some(expr) = expr {
            println!("{}", eval(expr.borrow()));
        }
    }
}

#[derive(Debug, PartialEq, Clone)]
enum Token {
    Number(f64),
    ADD,
    SUB,
    MUL,
    DIV,
    MOD,
    LParen,
    RParen,
    
}

struct Lexer {
    // 入力された文字列
    input: Vec<char>,
    // 文字列の解析中のインデックス
    position: usize,
}

impl Lexer {
    // 初期化
    fn new(input: Vec<char>) -> Lexer {
        Lexer { input, position: 0 }
    }
    // 現在解析中の文字を字句として取得し、インデックスを一つ進める
    fn token(&mut self) -> Option<Token> {
        use std::iter::FromIterator;
        // 空白をスキップする
        while self.curr().is_some() && self.curr().unwrap().is_whitespace() {
            self.next();
        }
        // 現在解析中の文字を取得して字句に変換する
        let curr = self.curr()?;
        let token = if Self::is_number(curr) {
            // 数字の場合
            let mut number = vec![*curr];
            while self.peek().is_some() && Self::is_number(self.peek().unwrap()) {
                self.next();
                number.push(*self.curr().unwrap());
            }
            String::from_iter(number)
                .parse::<f64>()
                .ok()
                .and_then(|n| Some(Token::Number(n)))
        } else {
            // 数字以外の場合
            match curr {
                &'+' => Some(Token::ADD),
                &'-' => Some(Token::SUB),
                &'*' => Some(Token::MUL),
                &'/' => Some(Token::DIV),
                &'%' => Some(Token::MOD),
                &'(' => Some(Token::LParen),
                &')' => Some(Token::RParen),
                _ => None,
            }
        };
        self.next();
        return token;
    }
    // 入力された文字列の解析するインデックスをひとつ進める
    fn next(&mut self) {
        self.position += 1;
    }
    // 現在解析中の文字
    fn curr(&mut self) -> Option<&char> {
        self.input.get(self.position)
    }
    // 次に解析する文字
    fn peek(&mut self) -> Option<&char> {
        self.input.get(self.position + 1)
    }
    // 文字が数字であるかどうか
    fn is_number(c: &char) -> bool {
        c.is_ascii_digit() || c == &'.'
    }
}

#[test]
fn test_lexer() {
    let mut lexer = Lexer::new("1 + 2".chars().collect());
    assert_eq!(lexer.token(), Some(Token::Number(1_f64)));
    assert_eq!(lexer.token(), Some(Token::ADD));
    assert_eq!(lexer.token(), Some(Token::Number(2_f64)));
    assert_eq!(lexer.token(), None);
}

#[derive(Debug)]
enum Expr {
    // 数字
    Number(f64),
    // 前置演算子式
    // 式の前に演算子のついた式
    // 例）"-10", "-(1 + 2)"
    PrefixExpr {
        operator: String,
        right: Box<Expr>,
    },
    // 中置演算子式
    // 式と式の間に演算子のある式
    // 例）"1 + 2", "3 * (4 + 5 + 6)"
    InfixExpr {
        left: Box<Expr>,
        operator: String,
        right: Box<Expr>,
    },
}

#[derive(PartialOrd, PartialEq)]
enum Precedence {
    LOWEST,
    SUM,
    PRODUCT,
    PREFIX,
}

struct Parser {
    // 字句解析器
    lexer: Lexer,
    // 現在解析中の字句
    curr: Option<Token>,
    // 次に解析する字句
    peek: Option<Token>,
}

impl Parser {
    fn new(mut lexer: Lexer) -> Parser {
        let curr = lexer.token();
        let peek = lexer.token();
        Parser { lexer, curr, peek }
    }
    fn parse(&mut self) -> Option<Box<Expr>> {
        self.parse_expression(Precedence::LOWEST)
    }
    fn parse_expression(&mut self, precedence: Precedence) -> Option<Box<Expr>> {
        let mut left = self.parse_prefix()?;

        while self.peek.is_some() && precedence < self.peek_precedence() {
            self.next();
            left = self.parse_infix(left)?;
        }

        return Some(left);
    }
    fn parse_prefix(&mut self) -> Option<Box<Expr>> {
        match self.curr.as_ref()? {
            Token::SUB => self.parse_minus(),
            Token::Number(_) => self.parse_number(),
            Token::LParen => self.parse_grouped_expression(),
            _ => None,
        }
    }
    fn parse_minus(&mut self) -> Option<Box<Expr>> {
        self.next();
        let number = self.parse_expression(Precedence::PREFIX)?;
        return Some(Box::new(Expr::PrefixExpr {
            operator: "SUB".to_string(),
            right: number,
        }));
    }
    fn parse_number(&mut self) -> Option<Box<Expr>> {
        match self.curr.borrow() {
            Some(Token::Number(n)) => Some(Box::new(Expr::Number(*n))),
            _ => None,
        }
    }
    fn parse_grouped_expression(&mut self) -> Option<Box<Expr>> {
        self.next();
        let expression = self.parse_expression(Precedence::LOWEST);
        if self.is_peek(&Token::RParen) {
            self.next();
            return expression;
        } else {
            return None;
        }
    }
    fn parse_infix(&mut self, left: Box<Expr>) -> Option<Box<Expr>> {
        let token = self.curr.as_ref()?;
        match token {
            Token::ADD | Token::SUB | Token::MUL | Token::DIV | Token::MOD => {
                self.parse_infix_expression(left)
            }
            _ => Some(left),
        }
    }
    fn parse_infix_expression(&mut self, left: Box<Expr>) -> Option<Box<Expr>> {
        let token = self.curr.as_ref()?;
        let operator = format!("{:?}", token);
        let precedence = Self::token_precedence(token);
        self.next();
        let right = self.parse_expression(precedence)?;
        return Some(Box::new(Expr::InfixExpr {
            left,
            operator,
            right,
        }));
    }
    fn next(&mut self) {
        self.curr = self.peek.clone();
        self.peek = self.lexer.token();
    }
    fn is_peek(&self, token: &Token) -> bool {
        if self.peek.is_none() {
            return false;
        }
        mem::discriminant(self.peek.as_ref().unwrap()) == mem::discriminant(token)
    }
    fn peek_precedence(&self) -> Precedence {
        let token = self.peek.borrow();
        if token.is_none() {
            return Precedence::LOWEST;
        }
        return Self::token_precedence(token.as_ref().unwrap());
    }
    fn token_precedence(token: &Token) -> Precedence {
        match token {
            Token::ADD | Token::SUB | Token::MOD => Precedence::SUM,
            Token::DIV | Token::MUL => Precedence::PRODUCT,
            _ => Precedence::LOWEST,
        }
    }
}

#[test]
fn test_parser() {
    do_parser(
        "1 + 2",
        r#"Some(InfixExpr { left: Number(1.0), operator: "ADD", right: Number(2.0) })"#,
    );
    do_parser("- 1 + 2 * 3",
             r#"Some(InfixExpr { left: PrefixExpr { operator: "SUB", right: Number(1.0) }, operator: "ADD", right: InfixExpr { left: Number(2.0), operator: "MUL", right: Number(3.0) } })"#);
}

#[cfg(test)]
fn do_parser(input: &str, expect: &str) {
    let lexer = Lexer::new(input.chars().collect());
    let mut parser = Parser::new(lexer);
    assert_eq!(format!("{:?}", parser.parse()), expect);
}

fn eval(expr: &Expr) -> f64 {
    match expr {
        Expr::Number(n) => *n,
        Expr::PrefixExpr { operator: _, right } => -eval(right),
        Expr::InfixExpr {
            left,
            operator,
            right,
        } => {
            let left = eval(left);
            let right = eval(right);
            match operator.as_str() {
                "ADD" => left + right,
                "SUB" => left - right,
                "MUL" => left * right,
                "DIV" => left / right,
                "MOD" => left % right,
                _ => panic!("invalid operator"),
            }
        }
    }
}

#[test]
fn test_eval() {
    do_eval("1 + 2", 3_f64);
    do_eval("1 + 2 * 3", 7_f64);
    do_eval("1 + (2 + 3) * -(3 / 3)", -4_f64);
}

#[cfg(test)]
fn do_eval(input: &str, expect: f64) {
    let lexer = Lexer::new(input.chars().collect());
    let mut parser = Parser::new(lexer);
    let result = eval(parser.parse().unwrap().borrow());
    assert_eq!(result, expect);
}