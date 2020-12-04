#!/bin/sh
# Generate scaffolding for future solutions

for i in {1..24};
do
  f+="import 'day${i}/solution.dart' as day${i};
"
done

f+="
final List<Object> solutions = ["
for i in {1..24};
do
  f+="
  day${i}.SolutionA(),
  day${i}.SolutionB(),"
done
f+="
];"
echo "$f" > lib/src/solutions.dart

for i in {1..24};
do
  dir="lib/src/day$i"
  [ ! -d $dir ] && mkdir $dir

  f1="$dir/inputs.dart"
  if [ ! -f $f1 ]; then
    echo "const inputsDay${i} = \"\"\"
\"\"\";" > $f1
  fi

  f2="$dir/solution.dart"
  if [ ! -f $f2 ]; then
    echo "import 'package:aoc2020_solutions/src/adventSolution.dart';

import 'inputs.dart';

List<String> _parseInputs(String inputs) =>
    inputs.split('\n').where((element) => element.isNotEmpty);
List<String> _inputs = _parseInputs(inputsDay${i});

abstract class _Day${i}Solution extends AdventSolution {
  _Day${i}Solution(name) : super($i, name);
}

class SolutionA extends _Day${i}Solution {
  SolutionA() : super('A');

  String getSolution() {
    return _inputs.length.toString();
  }
}

class SolutionB extends _Day${i}Solution {
  SolutionB() : super('B');

  String getSolution() {
    return \"\";
  }
}
" > $f2
  fi
done
