import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay10);

abstract class _Day10Solution extends AdventSolution {
  _Day10Solution(name) : super(10, name);
}

class SolutionA extends _Day10Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day10Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

