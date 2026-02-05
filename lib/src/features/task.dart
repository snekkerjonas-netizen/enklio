class Task {
  final String title;
  final Duration duration;
  final Duration bufferDuration;

  const Task({
    required this.title,
    required this.duration,
    this.bufferDuration = const Duration(seconds: 0),
  });
}
