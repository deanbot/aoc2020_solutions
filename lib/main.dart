import 'package:aoc2020_solutions/src/day1/solution.dart' as day1;
import 'package:aoc2020_solutions/src/day2/solution.dart' as day2;
import 'package:flutter/material.dart';

void main() {
  final List<Object> solutions = [
    day1.SolutionA(),
    day1.SolutionB(),
    day2.SolutionA(),
    day2.SolutionB()
  ];
  solutions.forEach((s) => print(s.toString()));

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdventSolutionsPage(),
      title: "Advent of Code",
    );
  }
}

class AdventSolutionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advent of Code Solutions'),
      ),
      body: Stack(
        children: [AdventDay1(), AdventDay2()],
      ),
    );
  }
}

class AdventDay1 extends StatelessWidget {
  final solutionA = day1.SolutionA();
  final solutionB = day1.SolutionB();
  AdventDay1();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      crossAxisCount: 2,
      children: [Text(solutionA.toString()), Text(solutionB.toString())],
    );
  }
}

class AdventDay2 extends StatelessWidget {
  final solutionA = day2.SolutionA();
  final solutionB = day2.SolutionB();
  AdventDay2();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      crossAxisCount: 2,
      children: [Text(solutionA.toString()), Text(solutionB.toString())],
    );
  }
}
