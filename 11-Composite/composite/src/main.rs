// インターフェースみたいなやつ
trait Composite {
    fn get_name(&self) -> String;
    fn get_child(&self) -> Option<&Box<dyn Composite>>;
    fn set_child(&mut self, c: Box<dyn Composite>);
    fn print_child_name_recursive(&self);
}

// ファイルクラスみたいなやつ
struct File {
    name: String,
    child: Option<Box<dyn Composite>>,
}

impl File {
    fn new(name: String) -> File {
        File {
            name: name,
            child: None,
        }
    }
}

impl Composite for File {
    fn get_name(&self) -> String {
        self.name.clone()
    }
    fn get_child(&self) -> Option<&Box<dyn Composite>> {
        match self.child {
            Some(ref x) => Some(x),
            None => None,
        }
    }
    fn set_child(&mut self, c: Box<dyn Composite>) {
        self.child = Some(c);
    }
    fn print_child_name_recursive(&self) {
        print!(" -> {}", self.get_name());
        if let Some(x) = self.get_child() {
            x.print_child_name_recursive();
        } else {
            println!("")
        }
    }
}

// ディレクトリクラスみたいなやつ
struct Directory {
    f: File,
}

impl Directory {
    fn new(name: String) -> Directory {
        Directory { f: File::new(name) }
    }
}

impl Composite for Directory {
    fn get_name(&self) -> String {
        self.f.get_name()
    }
    fn get_child(&self) -> Option<&Box<dyn Composite>> {
        self.f.get_child()
    }
    fn set_child(&mut self, c: Box<dyn Composite>) {
        self.f.set_child(c)
    }
    fn print_child_name_recursive(&self) {
        self.f.print_child_name_recursive()
    }
}
fn main() {
    let mut dir_1 = Directory::new("root".to_string());
    let mut dir_2 = Directory::new("boot".to_string());

    let file_1 = File::new("test_file".to_string());

    dir_2.set_child(Box::new(file_1));
    dir_1.set_child(Box::new(dir_2));
    println!("START!");
    dir_1.print_child_name_recursive();
}
