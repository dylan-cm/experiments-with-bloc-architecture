import 'package:flutter/material.dart';
import 'provider.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'nav_bloc.dart';

class MyApp extends StatelessWidget{
  final _pages = [
    ScreenOne(),
    ScreenTwo(),
  ];
  final navBloc = NavBloc();

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        home: StreamBuilder(
          stream: navBloc.indexStream,
          initialData: 0,
          builder: (context, snapshot) => Scaffold(
            bottomNavigationBar: pageNav(context),
            body: _pages[snapshot.data],
          ),
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
      onTap: (index) => navBloc.setIndex(index),
      currentIndex: navBloc.index,
    );
  }
}