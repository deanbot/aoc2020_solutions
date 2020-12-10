import 'dart:math';

import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<int> _parseInputs(String inputs) => inputs
    .split('\n')
    .where((element) => element.isNotEmpty)
    .map((e) => int.parse(e))
    .toList();
List<int> _inputs = _parseInputs(inputsDay9b);

abstract class _Day9Solution extends AdventSolution {
  _Day9Solution(name) : super(9, name);
}

class SolutionA extends _Day9Solution {
  SolutionA() : super('A');

  String getSolution() {
    var stackLength = 5;
    // var stackLength = 25;
    var stack = <int>[..._inputs.take(stackLength)];
    return _inputs.skip(stackLength).firstWhere((value) {
      var valid = false;
      for (var n in stack) {
        withoutN(e) => e != n;
        if (stack.where(withoutN).contains(value - n)) {
          valid = true;
          break;
        }
      }
      stack.removeAt(0);
      stack.add(value);
      return !valid;
    }).toString();
  }
}

class SolutionB extends _Day9Solution {
  SolutionB() : super('B');

  String getSolution() {
    // var search = 127;
    var search = 90433990;
    var total = 0, i = 0, startingIndex = 0, seq = <int>[];
    while (!(seq.length > 2 && total == search) &&
        startingIndex < _inputs.length) {
      seq.add(_inputs[i++]);
      total += seq.last;

      // reached end, increment starting index
      if (i == _inputs.length && total != search) {
        i = ++startingIndex;
        seq.clear();
        total = 0;
      }
    }
    return seq.length > 0 ? (seq.reduce(min) + seq.reduce(max)).toString() : '';
  }
}
