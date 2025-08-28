import gleam.{Error as NativeError}

/// RFC 5424
pub type Level {
  Debug
  Info
  Notice
  Warning
  Error
  Critical
  Alert
  Emergency
}

pub fn level_from_string(string) {
  case string {
    "debug" -> Ok(Debug)
    "info" -> Ok(Info)
    "notice" -> Ok(Notice)
    "warning" -> Ok(Warning)
    "error" -> Ok(Error)
    "critical" -> Ok(Critical)
    "alert" -> Ok(Alert)
    "emergency" -> Ok(Emergency)
    _ -> NativeError(Nil)
  }
}

pub fn level_to_string(level) {
  case level {
    Debug -> "debug"
    Info -> "info"
    Notice -> "notice"
    Warning -> "warning"
    Error -> "error"
    Critical -> "critical"
    Alert -> "alert"
    Emergency -> "emergency"
  }
}
