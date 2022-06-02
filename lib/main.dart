import 'package:flutter/material.dart';
import 'package:mnist_app/pages/upload_page.dart';
import 'package:mnist_app/pages/drawing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 1;

  List tabs = [
    const UploadImage(),
    const Center(child: Text("Drawing Page")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedFontSize: 14.0,
          unselectedFontSize: 14.0,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.image), label: "Image"),
            BottomNavigationBarItem(icon: Icon(Icons.album), label: "Draw"),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}
