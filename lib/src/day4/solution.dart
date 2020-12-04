import 'package:aoc2020_solutions/src/adventSolution.dart';
import 'package:aoc2020_solutions/src/day4/inputs.dart';

List<Passport> _parseInputs(String inputs) => inputs
    .split("\n\n")
    .where((e) => e.isNotEmpty)
    .map<Passport>((e) => Passport.fromString(e))
    .toList();
var _passports = _parseInputs(inputsDay4);

class Passport {
  Map<String, String> _data = {};
  static final passportFields = const <String>{
    'byr', // (Birth Year)
    'iyr', // (Issue Year)
    'eyr', // (Expiration Year)
    'hgt', // (Height)
    'hcl', // (Hair Color)
    'ecl', // (Eye Color)
    'pid', // (Passport ID)
    'cid', // (Country ID)
  };
  Passport.fromString(String input) {
    // replace new lines with spaces
    input.replaceAll(RegExp(r'\n'), ' ').split(' ').forEach((e) {
      var p = e.split(':');
      if (passportFields.contains(p[0])) {
        var key = p[0];
        this._data[key] = p[1];
      }
    });
  }

  bool isSet(String key) => _data.containsKey(key) && _data[key].isNotEmpty;

  bool hasAllFields(Set<String> requiredFields) =>
      requiredFields.every((f) => isSet(f));

  bool allFieldsValid(Map<String, Function(String)> validations) =>
      validations.keys.every((k) {
        if (!isSet(k)) {
          return false;
        }
        var v = _data[k];
        var valid = validations[k](v);
        return valid;
      });
}


abstract class _Day4Solution extends AdventSolution {
  _Day4Solution(name) : super(4, name);
}

class SolutionA extends _Day4Solution {
  SolutionA() : super("A");

  String getSolution() {
    var requiredFields = <String>{...Passport.passportFields.toList()};
    requiredFields.remove('cid');
    return _passports
        .map<bool>((p) => p.hasAllFields(requiredFields))
        .where((element) => element)
        .toList()
        .length
        .toString();
  }
}

class SolutionB extends _Day4Solution {
  SolutionB() : super("B");

  String getSolution() {
    var validations = <String, Function(String)>{
      // four digits; at least 1920 and at most 2002.
      'byr': (v) {
        var iv = int.parse(v);
        return v.length == 4 && iv >= 1920 && iv <= 2002;
      },

      // four digits; at least 2010 and at most 2020.
      'iyr': (v) {
        var iv = int.parse(v);
        return v.length == 4 && iv >= 2010 && iv <= 2020;
      },

      // four digits; at least 2020 and at most 2030.
      'eyr': (v) {
        var iv = int.parse(v);
        return v.length == 4 && iv >= 2020 && iv <= 2030;
      },

      // a number followed by either cm or in:
      // If cm, the number must be at least 150 and at most 193.
      // If in, the number must be at least 59 and at most 76.
      'hgt': (v) {
        if (v.contains('cm')) {
          var p = v.split('cm'), pv = p.length > 0 ? int.parse(p[0]) : 0;
          return pv >= 150 && pv <= 193;
        } else if (v.contains('in')) {
          var p = v.split('in'), pv = p.length > 0 ? int.parse(p[0]) : 0;
          return pv >= 59 && pv <= 76;
        } else {
          return false;
        }
      },

      // a # followed by exactly six characters 0-9 or a-f
      'hcl': (v) {
        return RegExp(r'#[a-f|0-9]{6}').hasMatch(v);
      },

      // exactly one of: amb blu brn gry grn hzl oth.
      'ecl': (v) {
        var valid = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'];
        return valid.contains(v);
      },

      // a nine-digit number, including leading zeroes.
      'pid': (v) {
        return v.length == 9 && int.tryParse(v) != null;
      },
    };
    return _passports
        .map<bool>((p) => p.allFieldsValid(validations))
        .where((v) => v)
        .toList()
        .length
        .toString();
  }
}
