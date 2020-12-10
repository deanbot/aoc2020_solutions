import 'dart:math';

import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<int> _parseInputs(String inputs) => inputs
    .split('\n')
    .where((el) => el.isNotEmpty)
    .map((e) => int.parse(e))
    .toList();
List<int> _inputs = _parseInputs(inputsDay10b);

abstract class _Day10Solution extends AdventSolution {
  _Day10Solution(name) : super(10, name);
}

class SolutionA extends _Day10Solution {
  SolutionA() : super('A');

  String getSolution() {
    _inputs.sort();
    var jolt = 0, diff1 = 0, diff2 = 0, diff3 = 1;
    for (var num in _inputs) {
      var diff = num - jolt;
      if (diff > 3) {
        throw "Joltage rating exceeded";
      }
      jolt = num;
      switch (diff) {
        case 1:
          diff1++;
          break;
        case 2:
          diff2++;
          break;
        case 3:
          diff3++;
          break;
      }
    }
    return (diff1 * diff3).toString();
  }
}

class SolutionB extends _Day10Solution {
  SolutionB() : super('B');

  String getSolution() {
    var jolt = 0, diffs = '';
    for (var num in _inputs) {
      var diff = num - jolt;
      if (diff > 3) {
        throw "Joltage rating exceeded";
      }
      jolt = num;
      diffs += diff.toString();
    }
    diffs += '3';

    // get sequences of 2, 3, or 4 1-diff jolts in a row
    var seq = diffs.split('3'),
        // get count of each seq
        diff2 = seq.fold(0, (prev, el) => el == '11' ? ++prev : prev),
        diff3 = seq.fold(0, (prev, el) => el == '111' ? ++prev : prev),
        diff4 = seq.fold(0, (prev, el) => el == '1111' ? ++prev : prev);

    // get total by multiplying total number of permutations of each seq option
    return ((diff2 > 0 ? pow(2, diff2) : 1) * // diff2 = 2 permutations
            (diff3 > 0 ? pow(4, diff3) : 1) * // diff3 = 4 permutations
            (diff4 > 0 ? pow(7, diff4) : 1)) // diff4 = 7 permutations
        .toString();
  }
}
