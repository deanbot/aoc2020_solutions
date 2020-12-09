import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty).toList();
List<String> _inputs = _parseInputs(inputsDay8b);

class GameBoy {
  final List<String> bootCommands;
  var memory = [];
  int i;
  int acc;
  GameBoy({this.bootCommands});

  int boot() {
    acc = i = 0;
    memory = [...bootCommands];
    var command, errorReached = false;
    while (!errorReached && i < memory.length) {
      command = memory[i];
      memory[i] = null;
      if (command != null) {
        i += eval(command);
      } else {
        errorReached = true;
      }
    }
    if (errorReached) {
      throw "Stack Overflow";
    }
    return acc;
  }

  int eval(String command) {
    var change = 1;
    var opCode = command.split(' ')[0];
    var deg = int.parse(command.split(' ')[1].replaceAll('+', ''));
    if (opCode == 'acc') {
      acc += deg;
    }
    if (opCode == 'jmp') {
      change = deg;
    }
    return change;
  }
}

abstract class _Day8Solution extends AdventSolution {
  _Day8Solution(name) : super(8, name);
}

class SolutionA extends _Day8Solution {
  SolutionA() : super('A');

  String getSolution() {
    var acc, gameBoy = GameBoy(bootCommands: _inputs);
    try {
      gameBoy.boot();
    } catch (e) {}
    acc = gameBoy.acc;
    return acc.toString();
  }
}

class SolutionB extends _Day8Solution {
  final List<String> _originalCommands;
  List<String> _bootCommands;
  SolutionB()
      : _originalCommands = _inputs,
        _bootCommands = [..._inputs],
        super('B');

  String getSolution() {
    GameBoy gb;
    var result;
    var i = 0;
    while (result == null) {
      gb = GameBoy(bootCommands: bootCommands);
      try {
        result = gb.boot();
      } catch (e) {
        var swapResult = swapNextCommand();
        if (swapResult < 0) {
          result = -1;
        }
      }
    }
    return gb.acc.toString();
  }

  get bootCommands {
    return _bootCommands;
  }

  List<int> _swappedCommands = [];
  int swapNextCommand() {
    var i, swapped = false, commands = [..._originalCommands];
    for (i = 0; i < commands.length; i++) {
      if (_swappedCommands.contains(i)) {
        continue;
      }
      if (commands[i].indexOf('jmp') != -1) {
        commands[i] = commands[i].replaceAll('jmp', 'nop');
        swapped = true;
      } else if (commands[i].indexOf('nop') != -1) {
        swapped = true;
        commands[i] = commands[i].replaceAll('nop', 'jmp');
      }

      if (swapped) {
        _swappedCommands.add(i);
        break;
      }
    }
    _bootCommands = commands;
    return swapped ? i : -1;
  }
}
