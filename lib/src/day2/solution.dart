import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

// parse input line i.e.: "1-3 a: abcde" to get password record items
List<PasswordRecord> _parseInputs(String inputs) => inputs
        .split("\n")
        .where((element) => element.isNotEmpty)
        .map<PasswordRecord>((e) {
      var pieces = e.split(": "),
          policyPieces = pieces[0].split(' '),
          range = policyPieces[0].split('-');
      return PasswordRecord(
        password: pieces[1],
        targetLetter: policyPieces[1],
        targetLowerBounds: int.parse(range[0]),
        targetUpperBounds: int.parse(range[1]),
      );
    }).toList();
List<PasswordRecord> _passwords = _parseInputs(inputsDay2);

class PasswordRecord {
  final String _password;
  final String _targetLetter;
  final int _targetLowerBounds;
  final int _targetUpperBounds;
  PasswordRecord(
      {String password,
      String targetLetter,
      int targetLowerBounds,
      int targetUpperBounds})
      : _password = password,
        _targetLetter = targetLetter,
        _targetLowerBounds = targetLowerBounds,
        _targetUpperBounds = targetUpperBounds;

  bool get isValid {
    final match = RegExp(_targetLetter),
      targetCount = match.allMatches(_password).length;
    return targetCount >= _targetLowerBounds &&
        targetCount <= _targetUpperBounds;
  }

  String get password => this._password;
}

abstract class _Day2Solution extends AdventSolution {
  _Day2Solution(name) : super(2, name);
}

class SolutionA extends _Day2Solution {
  SolutionA() : super("A");

  String getSolution() {
    var validCount = _passwords.where((element) => element.isValid).length;
    return validCount.toString();
  }
}

class SolutionB extends _Day2Solution {
  SolutionB() : super("B");

  String getSolution() {
    return "";
  }
}
