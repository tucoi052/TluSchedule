import 'dart:convert';

class Schedule {
  final String subjects;
  final String dateBegin;
  final String dateEnd;
  final String time;
  final String weekday;
  final String room;

  Schedule(
      {this.subjects,
      this.dateBegin,
      this.dateEnd,
      this.time,
      this.weekday,
      this.room});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      subjects: json['Ten_mon'],
      dateBegin: json['Ngay_bat_dau'],
      dateEnd: json['Ngay_ket_thuc'],
      time: json['Tiet_hoc'],
      weekday: json['Thu_hoc'],
      room: json['Phong_hoc'],
    );
  }

  static Map<String, dynamic> toMap(Schedule schedule) => {
        'Ten_mon': schedule.subjects,
        'Ngay_bat_dau': schedule.dateBegin,
        'Ngay_ket_thuc': schedule.dateEnd,
        'Tiet_hoc': schedule.time,
        'Thu_hoc': schedule.weekday,
        'Phong_hoc': schedule.room,
      };

  static String encodeSchedules(List<Schedule> schedules) => json.encode(
        schedules
            .map<Map<String, dynamic>>((schedules) => Schedule.toMap(schedules))
            .toList(),
      );

  static List<Schedule> decodeSchedules(String schedules) =>
      (json.decode(schedules) as List<dynamic>)
          .map<Schedule>((item) => Schedule.fromJson(item))
          .toList();
}
