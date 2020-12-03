import 'package:aoc2020_solutions/src/adventSolution.dart';
import 'package:aoc2020_solutions/src/day3/inputs.dart';

abstract class _Day3Solution extends AdventSolution {
  _Day3Solution(name) : super(3, name);
}

class SolutionA extends _Day3Solution {
  SolutionA() : super("A");

  String getSolution() {
    const rateX = 3, rateY = 1;
    var x = 0, y = 0, treesCount = 0;
    do {
      x += rateX;
      y += rateY;
      if (y < _plotLines.length) {
        SpaceType type = _plotLines[y].spaceAt(x);
        // print('$x, $y: $type');
        if (type == SpaceType.tree) {
          treesCount++;
        }
      }
    } while (y < _plotLines.length);
    print('total: $treesCount');
    return treesCount.toString();
  }
}

class SolutionB extends _Day3Solution {
  SolutionB() : super("B");

  String getSolution() {
    return "";
  }
}

// get plot line objects from input string
List<PlotLine> _parseInputLines(String inputLines) => inputLines
    .split("\n")
    .where((element) => element.isNotEmpty)
    .map<PlotLine>((l) => PlotLine.fromString(l))
    .toList();
/*var _plotLines = _parseInputLines("""..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#""");*/
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
  String charAt(int index) =>
      spaceAt(index) == SpaceType.tree ? _charTree : _charOpen;
}
