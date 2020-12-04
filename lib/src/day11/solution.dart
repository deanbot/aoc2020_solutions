import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay11);

abstract class _Day11Solution extends AdventSolution {
  _Day11Solution(name) : super(11, name);
}

class SolutionA extends _Day11Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day11Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

