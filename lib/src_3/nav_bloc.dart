import 'package:rxdart/rxdart.dart';

class NavBloc {
  final _indexSubject = BehaviorSubject<int>(seedValue: 0);

  int get index => _indexSubject.stream.value;

  Function(int) get setIndex => (newIndex) => _indexSubject.sink.add(newIndex);

  ValueObservable<int> get indexStream => _indexSubject.stream;

  dispose(){
    _indexSubject.close();
  }
}