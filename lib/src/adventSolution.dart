abstract class AdventSolution {
  final int day;
  final String name;
  AdventSolution(this.day, this.name);

  String get solution => getSolution();

  // implement in subclass
  String getSolution();

  @override
  String toString() {
    return "Advent Of Code, "
        "Day $day "
        "${name.isNotEmpty ? name : ''} "
        "solution: $solution";
  }
}
