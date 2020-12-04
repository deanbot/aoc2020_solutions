import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay21);

abstract class _Day21Solution extends AdventSolution {
  _Day21Solution(name) : super(21, name);
}

class SolutionA extends _Day21Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day21Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

