import gleam/int

pub fn random() {
  Ok(int.random(100))
}

pub fn add(x, y) {
  Ok(x + y)
}
