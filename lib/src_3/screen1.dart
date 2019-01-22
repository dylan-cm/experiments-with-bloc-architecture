import 'package:flutter/material.dart';
import 'provider.dart';
import 'bloc1.dart';

class ScreenOne extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      final bloc = Provider.of(context);
      final blocOne = BlocOne();

      return Scaffold(
        appBar: AppBar(
          title: Text('Screen 1'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: StreamBuilder(
            stream: blocOne.numberStream,
            initialData: blocOne.number,
            builder: (context, snapshot){
              return Column(
                children: <Widget>[
                  Text(snapshot.data.toString()),
                  RaisedButton(
                    child: Text('+ 1'),
                    onPressed: ()=> blocOne.addNumber(),
                  )
                ]
              );
            },
          ),
        ),
      );
    }
}