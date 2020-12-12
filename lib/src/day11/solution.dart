import 'package:aoc2020_solutions/src/adventSolution.dart';
import 'package:aoc2020_solutions/src/day11/inputs.dart';

// import 'inputs.dart';

// dart doens't have [0..10] range syntax
Iterable<int> range(length) => Iterable<int>.generate(length).toList();

enum SpaceType { floor, empty, occupied }
enum Dir { NW, N, NE, E, SE, S, SW, W }

const spaceTypes = {
  '.': SpaceType.floor,
  'L': SpaceType.empty,
  '#': SpaceType.occupied
};
const spaceSymbols = {
  SpaceType.floor: '.',
  SpaceType.empty: 'L',
  SpaceType.occupied: '#',
};

var test = """.......#.
...#.....
.#.......
.........
..#L....#
....#....
.........
#........
...#.....""";

var testA = """.............
.L.L.#.#.#.#.
.............""";

List<List<SpaceType>> _inputs = inputsDay11b
    .split('\n')
    .where((element) => element.isNotEmpty)
    .map<List<SpaceType>>((e) => e.split('').map((c) => spaceTypes[c]).toList())
    .toList();

class Space {
  final int x;
  final int y;
  final List<List<int>> adjacent;
  SpaceType type;
  Space(this.x, this.y, this.adjacent, this.type);

  @override
  String toString() => spaceSymbols[type];
}

class Grid {
  final SpaceType occupied = SpaceType.occupied;
  final SpaceType empty = SpaceType.empty;
  final SpaceType floor = SpaceType.floor;

  final int rowLength;
  final int colLength;
  List<List<Space>> _rows;
  Grid.fromSpaceType(List<List<SpaceType>> inputs, {bool byLineOfSight = false})
      : colLength = inputs.length,
        // row range is built from a sample row (assumption: all rows are same length)
        rowLength = inputs.length > 0 ? inputs[0].length : 0 {
    SpaceType inputAt(int x, int y) => inputs[y][x];
    bool isSeat(loc) => inputAt(loc[0], loc[1]) != floor;
    final List<int> colRange = range(colLength), rowRange = range(rowLength);
    _rows = colRange.map<List<Space>>((y) {
      return rowRange.map<Space>((x) {
        // calculate adjacents (either by contact or sight)
        final SpaceType type = inputs[y][x];
        List<List<int>> adjacent = [];
        if (type != floor) {
          if (!byLineOfSight) {
            // get adjacents
            final int n = y - 1, s = y + 1;
            final List<SpaceType> row = inputs[y],
                rowN = n >= 0 ? inputs[n] : [],
                rowS = s <= colLength - 1 ? inputs[s] : [];
            adjacent = [
              ..._adjacentX(rowN, x, n, includeSelf: true),
              ..._adjacentX(row, x, y),
              ..._adjacentX(rowS, x, s, includeSelf: true),
            ].toList();
          } else {
            adjacent = Dir.values
                .map<List<int>>((dir) => locationsInDirection([x, y], dir)
                    .firstWhere(isSeat, orElse: () => null))
                .whereType<List<int>>()
                .toList();
          }
        }
        return Space(x, y, adjacent, type);
      }).toList();
    }).toList();
  }

  Iterable<List<int>> locationsInDirection(List<int> loc, Dir dir) sync* {
    var rX = 0, rY = 0;
    switch (dir) {
      case Dir.NW:
        rX = -1;
        rY = -1;
        break;
      case Dir.N:
        rX = 0;
        rY = -1;
        break;
      case Dir.NE:
        rX = 1;
        rY = -1;
        break;
      case Dir.E:
        rX = 1;
        rY = 0;
        break;
      case Dir.SE:
        rX = 1;
        rY = 1;
        break;
      case Dir.S:
        rX = 0;
        rY = 1;
        break;
      case Dir.SW:
        rX = -1;
        rY = 1;
        break;
      case Dir.W:
        rX = -1;
        rY = 0;
    }
    int x = loc[0] + rX, y = loc[1] + rY;
    bool edgeReached =
        !(x >= 0 && x <= rowLength - 1 && y >= 0 && y <= colLength - 1);
    if (!edgeReached) {
      yield [x, y];
      yield* locationsInDirection([x, y], dir);
    }
  }

  int _itt = 0;
  int _lastChanged = 0;
  tick({int tolerance = 4}) {
    // print('Itteration ${_itt++}');

    // print(this.toString());

    // get changes
    bool isSeat(e) => e.type != floor;
    var changes = []; // [Space space, SpaceType newType]
    _rows.forEach((row) {
      row.where(isSeat).forEach((seat) {
        if (seat.type == occupied) {
          // if adjacent where occupied length > tolerance then change to empty
          var adjacentFilledCount = seat.adjacent.where((loc) {
            final x = loc[0], y = loc[1];
            return spaceAt(x, y).type == occupied;
          }).length;
          if (adjacentFilledCount > tolerance - 1) {
            changes.add([seat, empty]);
          }
        } else {
          // if every adjacent is not occupied then change to occupied
          var adjacentEmpty = seat.adjacent.every((loc) {
            final x = loc[0], y = loc[1];
            return spaceAt(x, y).type != occupied;
          });
          if (seat.adjacent.isEmpty || adjacentEmpty) {
            changes.add([seat, occupied]);
          }
        }
      });
    });

    // apply changes
    changes.forEach((change) {
      final Space space = change[0];
      final SpaceType newType = change[1];
      spaceAt(space.x, space.y).type = newType;
    });

    if (_lastChanged != changes.length) {
      _lastChanged = changes.length;
      return tick(tolerance: tolerance);
    } else {
      return occupiedCount;
    }
  }

  Space spaceAt(int x, int y) => _rows[y][x];

  int get occupiedCount => _rows.fold(
      0, (v, row) => v + row.where((s) => s.type == occupied).length);

  List<List<int>> _adjacentX(List<SpaceType> seats, int x, int y,
      {bool includeSelf = false}) {
    if (seats.length == 0) {
      return [];
    }
    final int e = x + 1, w = x - 1;
    final bool eAdj = e <= seats.length - 1, wAdj = w >= 0;
    List<List<int>> adjacent = [];
    if (wAdj) {
      if (seats[w] != floor) {
        adjacent.add([w, y]);
      }
    }
    if (includeSelf && seats[x] != floor) {
      adjacent.add([x, y]);
    }
    if (eAdj) {
      if (seats[e] != floor) {
        adjacent.add([e, y]);
      }
    }
    return adjacent;
  }

  @override
  String toString() {
    return _rows
        .map<String>((r) => r.map((s) => s.toString()).join(''))
        .join("\n");
  }
}

abstract class _Day11Solution extends AdventSolution {
  _Day11Solution(name) : super(11, name);
}

class SolutionA extends _Day11Solution {
  SolutionA() : super('A');

  String getSolution() {
    return Grid.fromSpaceType(_inputs).tick().toString();
  }
}

class SolutionB extends _Day11Solution {
  SolutionB() : super('B');

  String getSolution() {
    return Grid.fromSpaceType(_inputs, byLineOfSight: true)
        .tick(tolerance: 5)
        .toString();
  }
}
