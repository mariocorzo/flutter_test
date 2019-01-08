import 'dart:async';

class BlocTest {
  final StreamController<int> _controller = StreamController<int>();

  Sink<int> get blocAdd => _controller.sink;

  BlocTest() {
    _controller.stream.listen((data) {
      print("Bloc listen");
    });
  }

  void dispose() {
    _controller.close();
  }
}
