import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay22);

abstract class _Day22Solution extends AdventSolution {
  _Day22Solution(name) : super(22, name);
}

class SolutionA extends _Day22Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day22Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

