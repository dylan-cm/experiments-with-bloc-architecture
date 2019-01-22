import 'package:flutter/material.dart';
import 'provider.dart';
import 'bloc2.dart';

class ScreenTwo extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      final bloc = Provider.of(context);
      final blocTwo = BlocTwo();

      return Scaffold(
        appBar: AppBar(
          title: Text('Screen 2'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: StreamBuilder(
            stream: blocTwo.numberStream,
            initialData: blocTwo.number,
            builder: (context, snapshot){
              return Column(
                children: <Widget>[
                  Text(snapshot.data.toString()),
                  RaisedButton(
                    child: Text('+ 1'),
                    onPressed: ()=> blocTwo.addNumber(),
                  )
                ]
              );
            },
          ),
        ),
      );
    }
}