import 'package:flutter/material.dart';
import 'provider.dart';
import 'screen1.dart';
import 'screen2.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        onGenerateRoute: routes,
      ),
    );
  }

  Widget pageNav(BuildContext context, int currentIndex){
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
      onTap: (index) => Navigator.pushNamed(context, '${index+1}'),
      currentIndex: currentIndex-1,
    );
  }

  Route routes(RouteSettings settings){
    if((settings.name == '/') | (settings.name == '1')) {
      return MaterialPageRoute(
        builder: (context){
          return Scaffold(
            body: ScreenOne(),
            bottomNavigationBar: pageNav(context, 1),
          );
        }
      );
    } 
    if(settings.name == '2') {
      return MaterialPageRoute(
        builder: (context){
          return Scaffold(
            body: ScreenTwo(),
            bottomNavigationBar: pageNav(context, 2),
          );
        }
      );
    }
    else{
      return MaterialPageRoute(
        builder: (context){
          return Scaffold(
            appBar: AppBar(
              title: Text('404: Uh Oh!'),
            ),
          );
        }
      );
    }
  }
}