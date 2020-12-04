import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay8);

abstract class _Day8Solution extends AdventSolution {
  _Day8Solution(name) : super(8, name);
}

class SolutionA extends _Day8Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day8Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

