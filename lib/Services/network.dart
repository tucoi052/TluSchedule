import 'dart:convert';
import 'package:http/http.dart' as http;

class NetWorkHelper {
  NetWorkHelper({this.url});

  final String url;

  Future getData() async {
    final res = await http.get(url);
    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else
      print(res.statusCode);
    return null;
  }
}
