class Task {
  final String? id;
  final String title;
  final Duration duration;
  final Duration bufferDuration;

  Task({
    this.id,
    required this.title,
    required this.duration,
    this.bufferDuration = const Duration.zero,
  });
}
