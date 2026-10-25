/// Status siklus hidup sebuah proyek. Dipakai lintas fitur (dashboard,
/// project tracking) sehingga diletakkan di core, bukan di domain salah satu
/// fitur.
enum ProjectStatus { notStarted, inProgress, onHold, completed }
