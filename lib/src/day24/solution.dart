import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay24);

abstract class _Day24Solution extends AdventSolution {
  _Day24Solution(name) : super(24, name);
}

class SolutionA extends _Day24Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day24Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

