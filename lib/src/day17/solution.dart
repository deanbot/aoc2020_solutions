import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay17);

abstract class _Day17Solution extends AdventSolution {
  _Day17Solution(name) : super(17, name);
}

class SolutionA extends _Day17Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day17Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

