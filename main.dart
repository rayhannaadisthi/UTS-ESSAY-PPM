import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyImageNavigationApp(),
    );
  }
}

class MyImageNavigationApp extends StatefulWidget {
  @override
  _MyImageNavigationAppState createState() => _MyImageNavigationAppState();
}

class _MyImageNavigationAppState extends State<MyImageNavigationApp> {
  List<String> imageUrls = [
    "https://picsum.photos/201",
    "https://picsum.photos/202",
    "https://picsum.photos/203",
    "https://picsum.photos/204",
    "https://picsum.photos/205",
    "https://picsum.photos/206",
    "https://picsum.photos/207",
    "https://picsum.photos/208",
    "https://picsum.photos/209",
    "https://picsum.photos/210",
  ];

  int currentIndex = 0;

  void goToFirst() {
    setState(() {
      currentIndex = 0;
    });
  }

  void goToNext() {
    setState(() {
      currentIndex = (currentIndex + 1) % imageUrls.length;
    });
  }

  void goToPrevious() {
    setState(() {
      currentIndex = (currentIndex - 1 + imageUrls.length) % imageUrls.length;
    });
  }

  void goToLast() {
    setState(() {
      currentIndex = imageUrls.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Navigation App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrls[currentIndex]),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: goToFirst,
                  child: Text('First'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: goToPrevious,
                  child: Text('Previous'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: goToNext,
                  child: Text('Next'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: goToLast,
                  child: Text('Last'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}