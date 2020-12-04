import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay23);

abstract class _Day23Solution extends AdventSolution {
  _Day23Solution(name) : super(23, name);
}

class SolutionA extends _Day23Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day23Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

