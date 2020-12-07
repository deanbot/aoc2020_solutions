import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<BagRule> _parseInputs(String inputs) => inputs
    .split('\n')
    .where((element) => element.isNotEmpty)
    .map<BagRule>((e) => BagRule.fromString(e))
    .toList();
var _inputs = _parseInputs(inputsDay7c);

class BagContents {
  final String color;
  final int quantity;
  BagContents({this.color, this.quantity});

  @override
  String toString() {
    return "$quantity $color bag(s)";
  }
}

class BagRule {
  final String color;
  final List<BagContents> contents;

  // i.e.: bright magenta bags contain 1 clear blue bag, 3 wavy indigo bags.
  BagRule.fromString(String input)
      : color = input.substring(0, input.indexOf(' bags')),
        contents = input
            .replaceAll('.', '')
            .split('contain ')[1]
            .split(', ')
            .map<dynamic>((e) {
              if (e == 'no other bags') {
                return null;
              }
              var pieces =
                  e.replaceAll(' bags', '').replaceAll(' bag', '').split(' ');
              return BagContents(
                  quantity: int.parse(pieces[0]),
                  color: pieces.sublist(1, pieces.length).join(' '));
            })
            .whereType<BagContents>()
            .toList();

  @override
  String toString() {
    return "$color bag contain: $contents";
  }
}

abstract class _Day7Solution extends AdventSolution {
  _Day7Solution(name) : super(7, name);
}

// recursively populate list of all rules including searchFor colors in their contents
List<BagRule> getContainers(List<String> searchFor, List<BagRule> containers) {
  // get list of rules that contain search color in their contents
  var newContainers = <BagRule>[];
  searchFor.forEach((search) {
    newContainers.addAll(_inputs
        .where((e) => e.contents.where((e) => e.color == search).length > 0)
        .toList());
  });

  // remove duplicates
  newContainers = newContainers.toSet().toList();

  // add new containers to list
  containers.addAll(newContainers);

  // do this search again for new list of containers otherwise return completed list
  if (newContainers.length > 0) {
    return getContainers(
        newContainers.map((e) => e.color).toList(), containers);
  } else {
    return containers;
  }
}

int getChildCount(String searchFor) {
  // get contents of bag by color
  List<BagContents> contents =
      _inputs.firstWhere((e) => e.color == searchFor).contents;
  return contents.fold(
      0,
      (previousValue, element) =>
          previousValue +
          element.quantity +
          element.quantity * getChildCount(element.color));
}

class SolutionA extends _Day7Solution {
  SolutionA() : super('A');

  String getSolution() {
    var containers = getContainers(["shiny gold"], []);
    return containers.length.toString();
  }
}

class SolutionB extends _Day7Solution {
  SolutionB() : super('B');

  String getSolution() {
    return getChildCount("shiny gold").toString();
  }
}
