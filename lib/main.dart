import 'package:aoc2020_solutions/src/day1/solution.dart' as day1;
import 'package:flutter/material.dart';

void main() {
  final List<Object> solutions = [day1.SolutionA(), day1.SolutionB()];
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
        children: [AdventDay1()],
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
