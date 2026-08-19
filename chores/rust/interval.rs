pub fn in_interval(minor: f64, x: f64, major: f64) -> bool {
    (minor..=major).contains(&x)
}
