import 'package:aoc2020_solutions/src/adventSolution.dart';
import 'package:aoc2020_solutions/src/day3/inputs.dart';

abstract class _Day3Solution extends AdventSolution {
  _Day3Solution(name) : super(3, name);
}

class SolutionA extends _Day3Solution {
  SolutionA() : super("A");

  String getSolution() {
    return getCount(3, 1).toString();
  }
}

class SolutionB extends _Day3Solution {
  SolutionB() : super("B");

  String getSolution() {
    var slopes = [
      [1, 1],
      [3, 1],
      [5, 1],
      [7, 1],
      [1, 2]
    ];
    return slopes
        .map<int>((s) => getCount(s[0], s[1]))
        .toList()
        .reduce((value, element) => element * value)
        .toString();
  }
}

// get total space type occurences at slope
int getCount(int rateX, int rateY, [SpaceType searchType = SpaceType.tree]) {
  var x = 0, y = 0, count = 0;
  do {
    x += rateX;
    y += rateY;
    if (y < _plotLines.length) {
      SpaceType type = _plotLines[y].spaceAt(x);
      if (type == searchType) {
        count++;
      }
    }
  } while (y < _plotLines.length);
  return count;
}

// get plot line objects from input string
List<PlotLine> _parseInputLines(String inputLines) => inputLines
    .split("\n")
    .where((element) => element.isNotEmpty)
    .map<PlotLine>((l) => PlotLine.fromString(l))
    .toList();
var _plotLines = _parseInputLines(inputsDay3);

// convert string to List<SpaceType>
const _charOpen = ".";
const _charTree = "#";
enum SpaceType { open, tree }
List<SpaceType> _parseInputLine(String inputLine) => inputLine.runes
    .map<SpaceType>((f) =>
        String.fromCharCode(f) == _charTree ? SpaceType.tree : SpaceType.open)
    .toList();

class PlotLine {
  final List<SpaceType> _template;
  PlotLine(List<SpaceType> inputLine) : _template = inputLine;
  PlotLine.fromString(String inputLine)
      : _template = _parseInputLine(inputLine);

  // get space type at x-index
  SpaceType spaceAt(int index) => _template[index % _template.length];

  // get char at x-index
  String charAt(int index) =>
      spaceAt(index) == SpaceType.tree ? _charTree : _charOpen;
}
