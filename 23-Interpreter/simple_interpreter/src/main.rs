struct Interpreter;

impl Interpreter {
    fn parse_and_excute(s: String) {
        let mut s = s.clone();
        // 空白前の位置がiに入ってくる
        if let Some(i) = s.find(' ') {
            // iを境に分ける，自分自身は0-i, 返り値はi-len()
            let word = s.split_off(i);
            // string -> usizeに変換
            let times = s.parse::<usize>().unwrap();
            // 回数分だけ表示
            for _ in 0..times {
                println!("{}", word);
            }
            println!("");
        }
    }
}

fn main() {
    // "回数 表示する文章"を入力することで，回数分だけ文章を表示する
    Interpreter::parse_and_excute("10 hey guys !".to_string());
}
