import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay20);

abstract class _Day20Solution extends AdventSolution {
  _Day20Solution(name) : super(20, name);
}

class SolutionA extends _Day20Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day20Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

