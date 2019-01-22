import 'package:flutter/material.dart';
import 'card_bloc.dart';

class PlayingCard extends StatelessWidget{
  final bloc = CardBloc();
  @override
    Widget build(BuildContext context) {
      return StreamBuilder(
        stream: bloc.colorStream,
        initialData: 'loading',
        builder: (context, snapshot){
          // print(snapshot.data);
          return Container(
            child: Text(snapshot.data),
            height: 20.0,
            );
        }
      );
    }

  void setColor(String color){
    bloc.setColor(color);
    print(bloc.color);
  }
}