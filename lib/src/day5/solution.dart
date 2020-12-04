import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay5);

abstract class _Day5Solution extends AdventSolution {
  _Day5Solution(name) : super(5, name);
}

class SolutionA extends _Day5Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day5Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

