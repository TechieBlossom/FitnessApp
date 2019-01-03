import 'dart:async';

class HomePageBloc {

  DateTime selectedDate = DateTime.now();

  StreamController<DateTime> _dateStreamController = StreamController<DateTime>();

  Stream<DateTime> get dateStream => _dateStreamController.stream;

  void addDate() {
    selectedDate = selectedDate.add(Duration(days: 1));
    _dateStreamController.sink.add(selectedDate);
  }

  void subtractDate() {
    selectedDate = selectedDate.subtract(Duration(days: 1));
    _dateStreamController.sink.add(selectedDate);
  }

  dispose() {
    _dateStreamController.close();
  }

}