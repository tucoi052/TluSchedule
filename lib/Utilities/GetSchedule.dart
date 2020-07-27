import 'package:TluSchedule/Models/Schedule.dart';
import 'package:intl/intl.dart';

class GetSchedule {
  final List<Schedule> list;
  GetSchedule({this.list});
  DateTime max;
  List<DateTime> listdate = [];
  List<List<Schedule>> listschedule = [];

  List<Schedule> getScheduleInDay(DateTime date) {
    List<Schedule> scheduletoday = [];
    for (var temp in list) {
      DateTime end = new DateFormat('dd/MM/yyyy').parse(temp.dateEnd);
      DateTime begin = new DateFormat('dd/MM/yyyy').parse(temp.dateBegin);

      for (int i = 0; i <= end.difference(begin).inDays; i++) {
        if (date.toString().split(' ')[0] ==
                begin.add(Duration(days: i)).toString().split(' ')[0] &&
            date.weekday == int.parse(temp.weekday) - 1) {
          scheduletoday.add(temp);
        }
      }
    }

    scheduletoday.sort((a, b) => int.parse(a.time.split(",")[0])
        .compareTo(int.parse(a.time.split(",")[0])));
    return scheduletoday;
  }

  void getScheduleweek() {
    max = DateFormat('dd/MM/yyyy').parse(list
        .reduce((curr, next) => DateFormat('dd/MM/yyyy')
                .parse(curr.dateEnd)
                .isBefore(DateFormat('dd/MM/yyyy').parse(next.dateEnd))
            ? next
            : curr)
        .dateEnd);

    for (int i = 0; i <= max.difference(DateTime.now()).inDays; i++) {
      List<Schedule> temp =
          getScheduleInDay(DateTime.now().add(Duration(days: i)));
      if (temp.isNotEmpty) {
        listdate.add(DateTime.now().add(Duration(days: i)));
        listschedule.add(temp);
      }
    }
  }
}
