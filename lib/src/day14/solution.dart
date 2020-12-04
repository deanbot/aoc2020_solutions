import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay14);

abstract class _Day14Solution extends AdventSolution {
  _Day14Solution(name) : super(14, name);
}

class SolutionA extends _Day14Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day14Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

