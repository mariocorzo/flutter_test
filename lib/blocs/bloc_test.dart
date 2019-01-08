import 'dart:async';

import 'package:rxdart/rxdart.dart';

class BlocTest {

  int _count = 0;

  final BehaviorSubject<int> _intCount =  BehaviorSubject<int>(seedValue: 0);
  final StreamController<int> _controller = StreamController<int>();

  Sink<int> get blocAdd => _controller.sink;
  Stream<int> get count => _intCount.stream;



  BlocTest() {
    _controller.stream.listen((data) {
      _count=_count + 1;
      _intCount.add(_count);
    });
  }

  void dispose() {
    _controller.close();
    _intCount.close();
  }
}
