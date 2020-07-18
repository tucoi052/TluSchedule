class Info {
  final String status;
  final String msv;
  final String pass;
  final String name;
  final String class_;
  final String majors;
  final String faculty;
  final String progress;
  final String sex;

  Info(
      {this.status,
      this.msv,
      this.pass,
      this.name,
      this.class_,
      this.majors,
      this.faculty,
      this.progress,
      this.sex});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      status: json['Status'],
      msv: json['Msv'],
      pass: json['Pass'],
      name: json['Ho_ten'],
      class_: json['Lop'],
      majors: json['Nganh'],
      faculty: json['Khoa'],
      progress: json['Tien_do'],
      sex: json['Gioi_tinh'],
    );
  }
}
