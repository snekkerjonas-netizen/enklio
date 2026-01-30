/// Represents a step in the cooking process
class CookingStep {
  final String id;
  final String instruction;
  final int durationMinutes;
  final bool isWaitStep;
  final String? tip;

  const CookingStep({
    required this.id,
    required this.instruction,
    required this.durationMinutes,
    this.isWaitStep = false,
    this.tip,
  });

  Duration get duration => Duration(minutes: durationMinutes);
}
