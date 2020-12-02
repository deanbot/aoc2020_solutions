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
    return Row(
      children: [Text(solutionA.toString()), Text(solutionB.toString())],
    );
  }
}

/*

const List<String> urls = [
  "https://www.ultraboardgames.com/the-taverns-of-tiefenthal/gfx/game11.jpg",
  "https://www.ultraboardgames.com/img/slideshow/the-taverns-of-tiefenthal.jpg",
  "https://www.ultraboardgames.com/the-taverns-of-tiefenthal/gfx/game2.jpg",
  "https://www.ultraboardgames.com/the-taverns-of-tiefenthal/gfx/components.jpg",
];

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Photo Viewer',
        home: GalleryPage(
          title: "Image Gallery",
          urls: urls,
        ));
  }
}

class GalleryPage extends StatelessWidget {
  final String title;
  final List<String> urls;

  GalleryPage({this.title, this.urls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(this.title)),
        body: GridView.count(
          primary: false,
          crossAxisCount: 2,
          children: List.of(urls.map((url) => Photo(url: url))),
        ));
  }
}

class Photo extends StatelessWidget {
  final String url;

  Photo({this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10, left: 5, right: 5),
        child: Image.network(url));
  }
}
*/
