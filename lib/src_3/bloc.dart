import 'package:rxdart/rxdart.dart';

class Bloc {
  final _numbersSubject = BehaviorSubject<int>(seedValue: 0);

  Bloc(){
    _numbersSubject.sink.add(1);
  }

  ValueObservable get numberStream => _numbersSubject.stream;

  Function() get addNumber => () => _numbersSubject.sink.add(this.number+1);

  int get number => _numbersSubject.stream.value;

  dispose(){
    _numbersSubject.close();
  }
}