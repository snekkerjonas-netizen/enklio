/// Represents an ingredient in a recipe
class Ingredient {
  final String name;
  final String amount;
  final String? unit;
  final String? preparation;

  const Ingredient({
    required this.name,
    required this.amount,
    this.unit,
    this.preparation,
  });

  @override
  String toString() {
    final parts = [amount];
    if (unit?.isNotEmpty ?? false) {
      parts.add(unit!);
    }
    parts.add(name);
    if (preparation?.isNotEmpty ?? false) {
      parts.add('($preparation)');
    }
    return parts.join(' ');
  }
}
