import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

abstract class _Day2Solution extends AdventSolution {
  _Day2Solution(name) : super(2, name);
}

class SolutionA extends _Day2Solution {
  SolutionA() : super("A");

  String getSolution() {
    var validCount =
        _passwords.where((element) => element.isValidLegacy).length;
    return validCount.toString();
  }
}

class SolutionB extends _Day2Solution {
  SolutionB() : super("B");

  String getSolution() {
    var validCount = _passwords.where((element) => element.isValid).length;
    return validCount.toString();
  }
}

// parse input lines i.e. of: "1-3 a: abcde" to get password record items
List<PasswordRecord> _parseInputs(String inputs) => inputs
        .split("\n")
        .where((element) => element.isNotEmpty)
        .map<PasswordRecord>((e) {
      var pieces = e.split(": "),
          policyPieces = pieces[0].split(' '),
          range = policyPieces[0].split('-');
      return PasswordRecord(
        password: pieces[1],
        searchCharacter: policyPieces[1],
        indexLower: int.parse(range[0]),
        indexUpper: int.parse(range[1]),
      );
    }).toList();
List<PasswordRecord> _passwords = _parseInputs(inputsDay2);

class PasswordRecord {
  final String _password;
  final String _searchCharacter;
  final int _indexLower;
  final int _indexUpper;
  PasswordRecord(
      {String password, String searchCharacter, int indexLower, int indexUpper})
      : _password = password,
        _searchCharacter = searchCharacter,
        _indexLower = indexLower,
        _indexUpper = indexUpper;

  // total search occurances fall within min and max as defined by lower and upper index
  bool get isValidLegacy {
    final match = RegExp(_searchCharacter),
        searchCount = match.allMatches(_password).length;
    return searchCount >= _indexLower && searchCount <= _indexUpper;
  }

  // search should occur in either index (1-based) but not both
  bool get isValid {
    var t1Valid = _password[_indexLower - 1] == _searchCharacter,
        t2Valid = _password[_indexUpper - 1] == _searchCharacter;
    return (t1Valid || t2Valid) && !(t1Valid && t2Valid);
  }

  String get password => this._password;
}
