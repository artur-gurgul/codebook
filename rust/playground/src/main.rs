trait TestType {
    fn pr(&mut self);
}

struct Test {
    name: String
}


impl TestType for Test {
    fn pr(&mut self) {
        println!("{}", self.name);
    }
}

 fn tt(t: &mut dyn TestType) {
    t.pr();
 }

fn main() {
    let mut t  = Test {
        name: String::from("tester"),
    };

    tt(t);
}