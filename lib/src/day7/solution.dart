import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay7);

abstract class _Day7Solution extends AdventSolution {
  _Day7Solution(name) : super(7, name);
}

class SolutionA extends _Day7Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day7Solution {
  SolutionB() : super('B');

  String getSolution() {
    return "";
  }
}

