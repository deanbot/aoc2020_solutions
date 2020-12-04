import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay6);

abstract class _Day6Solution extends AdventSolution {
  _Day6Solution(name) : super(6, name);
}

class SolutionA extends _Day6Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day6Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

