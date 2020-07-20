import 'package:TluSchedule/Models/Info.dart';
import 'package:TluSchedule/Models/Schedule.dart';
import 'package:TluSchedule/Services/network.dart';
import 'package:TluSchedule/Utilities/API.dart';

class Login {
  String msv, pass;
  Login({this.msv, this.pass});

  Info _info = new Info();
  Future<String> getStatus() async {
    var data = await NetWorkHelper(url: API().login(msv, pass)).getData();
    if (data != null) {
      final parsed = data.cast<Map<String, dynamic>>();
      _info = parsed.map<Info>((json) => Info.fromJson(json)).toList()[0];
      return _info.status;
    }
    return '404';
  }

  Info getInfo() => _info;

  Future<List<Schedule>> getShedule() async {
    var data = await NetWorkHelper(url: API().lichHoc(_info.msv, _info.pass))
        .getData();
    if (data != null) {
      final parsed = data.cast<Map<String, dynamic>>();
      return parsed.map<Schedule>((json) => Schedule.fromJson(json)).toList();
    }
    return null;
  }
}
