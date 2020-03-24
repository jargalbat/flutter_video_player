import 'package:flutter/material.dart';
import 'package:fluttervideoplayer/home/first_page.dart';
import 'package:fluttervideoplayer/home/second_page.dart';
import 'package:fluttervideoplayer/home/third_page.dart';
import 'package:video_player/video_player.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  /// Bottom navigation bar
  int _selectedIndex = 0;
  final List<Widget> _children = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video player"),
      ),
      body: _children[_selectedIndex], //
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('First'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Second'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Third'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
