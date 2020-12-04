import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay15);

abstract class _Day15Solution extends AdventSolution {
  _Day15Solution(name) : super(15, name);
}

class SolutionA extends _Day15Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day15Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

