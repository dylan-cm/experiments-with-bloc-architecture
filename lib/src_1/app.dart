import 'package:flutter/material.dart';
import 'bloc.dart';
import 'card.dart';

class MyApp extends StatelessWidget{
  final bloc = Bloc();

  @override
    Widget build(BuildContext context) {
      print(bloc.deckStream.value);

      return MaterialApp(
        home: StreamBuilder(
          stream: bloc.deckStream,
          builder: (context, snapshot) => Scaffold(
            appBar: AppBar(),
            body: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RaisedButton(child: Text('ADD'), onPressed: _addItem),
                    RaisedButton(child: Text('DELETE'), onPressed: _deleteItem)
                  ],
                ),
                buildList(bloc, snapshot),
              ],
            ),
          ),
        ),
      );
    }
  
  Widget buildList(Bloc bloc, snapshot){
    if (!snapshot.hasData) {return Container();} else{

      return Container(child: Text(snapshot.data.length.toString()),);


      // return ListView.builder(
      //   padding: EdgeInsets.all(8.0),
      //   itemExtent: 20.0,
      //   itemCount: bloc.deckStream.value.length,
      //   itemBuilder: (context, int index) {
      //     return FutureBuilder(
      //       builder: (context, snapshot) => bloc.deckStream.value[index],
      //     );
      //   },
      // );
    }
  }

  void _addItem(){
    bloc.addCard();
    bloc.addCard();
    bloc.deckStream.value[bloc.deckStream.value.length-1].setColor('red');
    String list = '';
    bloc.deckStream.value.forEach((card)=>list = list + card.bloc.color + ', ');
    print(list);
  }
  
  void _deleteItem(){
    bloc.deleteItem('black');
    String list = '';
    bloc.deckStream.value.forEach((card)=>list = list + card.bloc.color + ', ');
    print(list);
  }
}