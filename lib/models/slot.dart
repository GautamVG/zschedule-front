import './ground.dart';

class Slot {
  DateTime startTime, endTime;
  late Duration duration;
  String booker;
  Ground ground;

  Slot(
      {required this.startTime,
      required this.endTime,
      required this.booker,
      required this.ground});

  bool contains(DateTime time) {
    return (time.isAfter(startTime) && time.isBefore(endTime));
  }
}
