import 'dart:convert';

class Info {
  final String status;
  final String msv;
  final String pass;
  final String name;
  final String classs;
  final String majors;
  final String faculty;
  final String progress;
  final String sex;

  Info(
      {this.status,
      this.msv,
      this.pass,
      this.name,
      this.classs,
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
      classs: json['Lop'],
      majors: json['Nganh'],
      faculty: json['Khoa'],
      progress: json['Tien_do'],
      sex: json['Gioi_tinh'],
    );
  }

  static Map<String, dynamic> toMap(Info info) => {
        'Status': info.status,
        'Msv': info.msv,
        'Pass': info.pass,
        'Ho_ten': info.name,
        'Lop': info.classs,
        'Nganh': info.majors,
        'Khoa': info.faculty,
        'Tien_do': info.progress,
        'Gioi_tinh': info.sex,
      };

  static String encodeInfo(Info info) => json.encode(Info.toMap(info));

  static Info decodeInfo(String info) => Info.fromJson(json.decode(info));
}
