import 'package:flutter/material.dart';
import 'provider.dart';

class ScreenTwo extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      final bloc = Provider.of(context);
      return Scaffold(
        appBar: AppBar(
          title: Text('Screen 2'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: StreamBuilder(
            stream: bloc.numberStream,
            initialData: bloc.number,
            builder: (context, snapshot){
              return Column(
                children: <Widget>[
                  Text(snapshot.data.toString()),
                  RaisedButton(
                    child: Text('+ 1'),
                    onPressed: ()=> bloc.addNumber(),
                  )
                ]
              );
            },
          ),
        ),
      );
    }
}