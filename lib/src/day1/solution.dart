import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<int> _parseInputs(String inputs) => inputs
    .split("\n")
    .where((element) => element.isNotEmpty)
    .map((element) => int.parse(element))
    .toList();
List<int> _expenses = _parseInputs(inputsDay1);

abstract class _Day1Solution extends AdventSolution {
  _Day1Solution(name) : super(1, name);
}

class SolutionA extends _Day1Solution {
  SolutionA() : super("A");

  String getSolution() {
    var product;
    for (var expense in _expenses) {
      var index = _expenses.indexWhere(
          (element) => element != expense && element + expense == 2020);
      if (index == -1) {
        continue;
      }
      product = _expenses[index] * expense;
    }
    return product?.toString();
  }
}

class SolutionB extends _Day1Solution {
  SolutionB() : super("B");

  String getSolution() {
    int product;
    for (var eA in _expenses) {
      for (var eB in _expenses) {
        if (eB == eA) {
          continue;
        }
        for (var eC in _expenses) {
          if (eC == eA || eC == eB) {
            continue;
          }
          if ((eA + eB + eC) == 2020) {
            product = eA * eB * eC;
            break;
          }
        }
        if (product != null) {
          break;
        }
      }
      if (product != null) {
        break;
      }
    }

    return product.toString();
  }
}
