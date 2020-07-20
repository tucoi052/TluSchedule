import 'package:TluSchedule/Models/Schedule.dart';
import 'package:intl/intl.dart';

class GetSchedule {
  final List<Schedule> list;
  GetSchedule({this.list});

  List<Schedule> getScheduleToday() {
    List<Schedule> scheduletoday = [];
    for (var temp in list) {
      DateTime end = new DateFormat('dd/MM/yyyy').parse(temp.dateEnd);
      DateTime begin = new DateFormat('dd/MM/yyyy').parse(temp.dateBegin);

      for (int i = 0; i <= end.difference(begin).inDays; i++) {
        if (DateTime.now() == begin.add(Duration(days: i)) &&
            DateTime.now().weekday == int.parse(temp.weekday) - 1)
          scheduletoday.add(temp);
      }
    }

    scheduletoday.sort((a, b) => int.parse(a.time.split(",")[0])
        .compareTo(int.parse(a.time.split(",")[0])));
    return scheduletoday;
  }
}
