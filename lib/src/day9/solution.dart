import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay9);

abstract class _Day9Solution extends AdventSolution {
  _Day9Solution(name) : super(9, name);
}

class SolutionA extends _Day9Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day9Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

