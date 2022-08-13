struct Responsible {
    next: Option<Box<Responsible>>,
    responsible_person: Option<String>,
}
struct Question {
    text: Option<String>,
}

enum Level {
    High,
    Middle,
    Low,
}

trait Judge {}

impl Responsible {
    fn new(&self, next: Option<Box<Responsible>>, responsible_person: Option<String>) -> Self {
        Responsible {
            next: next,
            responsible_person: responsible_person,
        }
    }

    fn setNext(mut self, next: Option<Box<Responsible>>) {
        self.next = next;
    }

    fn putQuestion(self, question: Question) {}

    fn beAbleToJudge(self) {}
    fn judge(self, question: Question) {}
}

fn main() {
    println!("Hello, world!");
}
