#[path = "chores/rust/interval.rs"]
mod interval;

use interval::in_interval;

fn main() {
    for x in [1.0, 2.0, 4.5, 5.0, 6.0] {
        println!("{} -> {}", x, in_interval(2.0, x, 5.0));
    }
}
