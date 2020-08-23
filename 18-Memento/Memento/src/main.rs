// 内部状態を保つオブジェクト
trait Originator {
    fn generate_memento(&self) -> Box<dyn Memento>;
    fn restore_from_memento(&mut self, m: &dyn Memento);
}
// Mementoを保存，取得する
trait Caretaker {
    fn add_memento(&mut self, m: Box<dyn Memento>);
    fn get_memento(&mut self, index: usize) -> &dyn Memento;
}
// Memento
trait Memento {
    fn get_value(&self) -> usize;
}

#[derive(Debug)]
struct OriginatorX(usize);
impl Originator for OriginatorX {
    // mementoを作る，
    fn generate_memento(&self) -> Box<dyn Memento> {
        Box::new(MementoX(self.0))
    }
    fn restore_from_memento(&mut self, m: &dyn Memento) {
        self.0 = m.get_value()
    }
}

struct MementoX(usize);
impl Memento for MementoX {
    fn get_value(&self) -> usize {
        // フィールドの数字を返す
        self.0
    }
}

struct CaretakerX {
    // mementoのリストを保持
    history: Vec<Box<dyn Memento>>,
}

impl CaretakerX {
    fn new() -> CaretakerX {
        CaretakerX {
            history: Vec::new(),
        }
    }
}

impl Caretaker for CaretakerX {
    fn add_memento(&mut self, m: Box<dyn Memento>) {
        // 保存したmementoをリストにいれる
        self.history.push(m);
    }
    fn get_memento(&mut self, index: usize) -> &dyn Memento {
        // mementoリストから，もどすときのmementoを取得する
        &*self.history[index]
    }
}
fn main() {
    let mut caretaker = CaretakerX::new();
    let mut originator = OriginatorX(10);

    caretaker.add_memento(originator.generate_memento());
    println!("{:?}", originator);
    originator.0 = 99;
    println!("{:?}", originator);
    originator.restore_from_memento(caretaker.get_memento(0));
    println!("{:?}", originator);
}
