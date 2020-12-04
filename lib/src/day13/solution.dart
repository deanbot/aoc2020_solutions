import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay13);

abstract class _Day13Solution extends AdventSolution {
  _Day13Solution(name) : super(13, name);
}

class SolutionA extends _Day13Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day13Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

