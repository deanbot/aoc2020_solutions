import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split("\n").where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay4);

abstract class _Day4Solution extends AdventSolution {
  _Day4Solution(name) : super(4, name);
}

class SolutionA extends _Day4Solution {
  SolutionA() : super("A");

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day4Solution {
  SolutionB() : super("B");

  String getSolution() {
    return "";
  }
}
