// Dart imports:
import 'dart:async';

// handles cached state for data
abstract class LocalDataSource<T> {
  // ignore: close_sinks
  final StreamController<T> dataStreamController = StreamController<T>();

  void dispose();
}
