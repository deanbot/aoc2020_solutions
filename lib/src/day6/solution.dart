import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<Group> _parseInputs(String inputs) => inputs
    .split('\n\n')
    .where((element) => element.isNotEmpty)
    .map<Group>((e) => Group.fromString(e))
    .toList();
List<Group> _inputs = _parseInputs(inputsDay6);

// custom declarations form group
class Group {
  final List<String> uniqueAnswers;
  final List<String> unionAnswers;
  Group.fromString(String input)
      // flatten and remove duplicates
      : uniqueAnswers =
            input.split('\n').expand((e) => e.split('')).toSet().toList(),
        // convert to sets of letters and reduce via intersection
        unionAnswers = input
            .split('\n')
            .map((e) => e.split('').toSet())
            .reduce((value, element) => value.intersection(element))
            .toList();
}

abstract class _Day6Solution extends AdventSolution {
  _Day6Solution(name) : super(6, name);
}

class SolutionA extends _Day6Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs
        .map<int>((e) => e.uniqueAnswers.length)
        .fold(0, (previousValue, e) => previousValue + e)
        .toString();
  }
}

class SolutionB extends _Day6Solution {
  SolutionB() : super('B');

  String getSolution() {
    return _inputs
        .map<int>((e) => e.unionAnswers.length)
        .fold(0, (previousValue, e) => previousValue + e)
        .toString();
  }
}
