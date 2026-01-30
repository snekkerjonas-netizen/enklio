class Task {
  final String title;
  final Duration duration;
  final Duration bufferDuration;

  Task({
    required this.title,
    required this.duration,
    this.bufferDuration = const Duration(seconds: 0),
  });
}
