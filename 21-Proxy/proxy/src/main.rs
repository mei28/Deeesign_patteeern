// インターフェース
trait Teacher {
    fn question1(&self);
    fn question2(&self);
    fn question3(&self);
}
// 山田先生 代理じゃない人，主体
struct Yamada {}

impl Yamada {
    fn new() -> Self {
        Yamada {}
    }
}

// 山田先生は全ての答えを知っている．
impl Teacher for Yamada {
    fn question1(&self) {
        println!("~~~Ans1~~~");
    }
    fn question2(&self) {
        println!("~~~Ans2~~~");
    }
    fn question3(&self) {
        println!("~~~Ans3~~~");
    }
}

// 山田先生の代わりとなる先生. 今回のメインであるProxyに相当するもの
// 内部に山田先生がいる
struct Fujiwara {
    yamada: Yamada,
}

impl Fujiwara {
    fn new() -> Self {
        Fujiwara {
            yamada: Yamada::new(),
        }
    }
}

// 代理できている先生であるから，question3の答えがわからない！
impl Teacher for Fujiwara {
    fn question1(&self) {
        println!("藤原: それは「~~~Ans1~~~」だよ.");
    }
    fn question2(&self) {
        println!("藤原: それは「~~~Ans2~~」だよ.");
    }
    fn question3(&self) {
        // 答えがわからないよ...
        println!("藤原: ちょっとわかんないや，山田先生に聞いてみるね");
        // 山田先生に聞く
        println!("---山田先生に聞く---");
        println!("藤原: 聞いてきたよ-");
        self.yamada.question3();
        // 答えを代わりに行ってもらう
        println!("だって！！！");
    }
}
fn main() {
    let fujiwara: Fujiwara = Fujiwara::new();

    println!("========================================");
    println!("生徒: Q1の答えってなーに？");
    fujiwara.question1();
    println!("========================================");
    println!("生徒: じゃあQ2の答えって?");
    fujiwara.question2();
    println!("========================================");
    println!("生徒: 最後!Q3は??");
    fujiwara.question3();
    println!("========================================");
}
