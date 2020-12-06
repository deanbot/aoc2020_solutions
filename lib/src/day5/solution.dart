import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<BoardingPass> _parseInputs(String inputs) => inputs
    .split('\n')
    .where((element) => element.isNotEmpty)
    .map<BoardingPass>((element) => BoardingPass.fromString(element))
    .toList();
List<BoardingPass> _inputs = _parseInputs(inputsDay5);

class BoardingPass {
  int row;
  int column;
  BoardingPass.fromString(String input)
      : this.row = int.parse(
            input.substring(0, 7).replaceAll('B', '1').replaceAll('F', '0'),
            radix: 2),
        this.column = int.parse(
            input.substring(7).replaceAll('R', '1').replaceAll('L', '0'),
            radix: 2);
  int get seatId => row * 8 + column;
}

abstract class _Day5Solution extends AdventSolution {
  _Day5Solution(name) : super(5, name);
}

class SolutionA extends _Day5Solution {
  SolutionA() : super('A');

  String getSolution() {
    var highest = 0;
    _inputs.forEach((e) {
      if (highest < e.seatId) {
        highest = e.seatId;
      }
    });
    return highest.toString();
  }
}

class SolutionB extends _Day5Solution {
  SolutionB() : super('B');

  String getSolution() {
    var seatId, seatIds = _inputs.map<int>((e) => e.seatId).toList();
    seatIds.sort();
    for (var i = 0; i < seatIds.length - 1; i++) {
      if (i == 0) {
        continue;
      }

      // seat id found if previous is not current - 1
      final prevSeat = --seatIds[i];
      if (prevSeat != seatIds[i - 1]) {
        seatId = prevSeat;
        break;
      }
    }
    return seatId.toString();
  }
}
