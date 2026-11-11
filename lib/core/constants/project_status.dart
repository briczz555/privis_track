/// Status siklus hidup sebuah proyek. Dipakai lintas fitur (dashboard,
/// project tracking) sehingga diletakkan di core, bukan di domain salah satu
/// fitur.
enum ProjectStatus { notStarted, inProgress, onHold, completed }

ProjectStatus projectStatusFromApi(String value) =>
    switch (value.toLowerCase()) {
      'not_started' || 'not started' => ProjectStatus.notStarted,
      'in_progress' || 'in progress' => ProjectStatus.inProgress,
      'on_hold' || 'on hold' => ProjectStatus.onHold,
      'completed' => ProjectStatus.completed,
      _ => ProjectStatus.notStarted,
    };

String projectStatusToApi(ProjectStatus status) => switch (status) {
  ProjectStatus.notStarted => 'not_started',
  ProjectStatus.inProgress => 'in_progress',
  ProjectStatus.onHold => 'on_hold',
  ProjectStatus.completed => 'completed',
};
