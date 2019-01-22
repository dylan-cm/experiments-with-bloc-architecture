import 'package:flutter/material.dart';
import 'provider.dart';
import 'screen1.dart';
import 'screen2.dart';

class MyApp extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      return AppState();
    }
}
class AppState extends State<MyApp>{
  int _selectedIndex = 0;
  final _pages = [
    ScreenOne(),
    ScreenTwo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        home: Scaffold(
          bottomNavigationBar: pageNav(context),
          body: _pages[_selectedIndex],
        ),
      ),
    );
  }

  Widget pageNav(BuildContext context){
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.looks_one),
          title: Text('1'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.looks_two),
          title: Text('2'),
        ),
      ],
      onTap: (index) => setState(()=>_selectedIndex=index),
      currentIndex: _selectedIndex,
    );
  }
}