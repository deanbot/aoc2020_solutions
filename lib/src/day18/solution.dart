import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay18);

abstract class _Day18Solution extends AdventSolution {
  _Day18Solution(name) : super(18, name);
}

class SolutionA extends _Day18Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day18Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

