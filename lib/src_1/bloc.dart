import 'package:rxdart/rxdart.dart';
import 'card.dart';

class Bloc {
  List<PlayingCard> _deck = [];

  final _deckStream = BehaviorSubject<List<PlayingCard>>(
    seedValue: []
  );

  ValueObservable<List<PlayingCard>> get deckStream => _deckStream.stream;

  Future<Null> addCard() async {
    _deck.add(PlayingCard());
    _deckStream.sink.add(_deck);
  }

  void deleteItem(String color){
    _deck.removeWhere((i) => i.bloc.color == color);
    _deckStream.sink.add(_deck);
  }

  void dispose(){
    _deckStream.close();
  }
}