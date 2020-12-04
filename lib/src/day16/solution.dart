import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay16);

abstract class _Day16Solution extends AdventSolution {
  _Day16Solution(name) : super(16, name);
}

class SolutionA extends _Day16Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day16Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

