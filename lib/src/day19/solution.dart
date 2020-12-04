import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay19);

abstract class _Day19Solution extends AdventSolution {
  _Day19Solution(name) : super(19, name);
}

class SolutionA extends _Day19Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day19Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

