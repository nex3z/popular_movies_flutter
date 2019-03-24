import 'package:rxdart/rxdart.dart';

class BaseRequestBloc {
  final PublishSubject<Object> error = PublishSubject();

  void onError(Object e) {
    error.sink.add(e);
  }

  void dispose() {
    error.close();
  }
}