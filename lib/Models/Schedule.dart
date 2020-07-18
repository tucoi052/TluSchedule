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
}
