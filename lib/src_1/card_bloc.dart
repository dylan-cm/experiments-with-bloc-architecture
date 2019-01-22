import 'package:rxdart/rxdart.dart';

class CardBloc {
  final _colorStream = BehaviorSubject<String>(seedValue: 'black');

  String get color => _colorStream.stream.value;

  ValueObservable get colorStream => _colorStream.stream;

  Function(String) get setColor => (newColor) => _colorStream.sink.add(newColor);

  dispose(){
    _colorStream.close();
  }
}