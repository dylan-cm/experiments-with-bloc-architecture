import 'package:rxdart/rxdart.dart';

class BlocTwo {
  final _numbersSubject = BehaviorSubject<int>(seedValue: 0);

  BlocTwo(){
    _numbersSubject.sink.add(1);
  }

  ValueObservable get numberStream => _numbersSubject.stream;

  Function() get addNumber => () => _numbersSubject.sink.add(this.number+1);

  int get number => _numbersSubject.stream.value;

  dispose(){
    _numbersSubject.close();
  }
}