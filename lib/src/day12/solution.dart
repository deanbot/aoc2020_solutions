import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay12);

abstract class _Day12Solution extends AdventSolution {
  _Day12Solution(name) : super(12, name);
}

class SolutionA extends _Day12Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day12Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

