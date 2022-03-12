
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter PageView Tutorial",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  double currentPageIndex = 0.0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPageIndex = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final numberOfPages = List.generate(10, (index) => '$index');
    return Scaffold(
      body: PageView.builder(
        pageSnapping: false,
        onPageChanged: (value) {
          print(value);
        },
          physics: BouncingScrollPhysics(),
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: numberOfPages.length,
        itemBuilder: (context, index) {
          final fistPageItem = numberOfPages[index];
            return Container(
              color: index % 2 == 0 ? Colors.indigo : Colors.green,
              child: Center(child: Text("Page $fistPageItem", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),),
            );
          }
      ),
    );
  }
}
