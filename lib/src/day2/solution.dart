import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split("\n").where((element) => element.isNotEmpty).toList();
List<String> _passwords = _parseInputs(inputsDay2);

abstract class _Day2Solution extends AdventSolution {
  _Day2Solution(name) : super(2, name);
}

class SolutionA extends _Day2Solution {
  SolutionA() : super("A");

  String getSolution() {
    return "";
  }
}

class SolutionB extends _Day2Solution {
  SolutionB() : super("B");

  String getSolution() {
    return "";
  }
}
