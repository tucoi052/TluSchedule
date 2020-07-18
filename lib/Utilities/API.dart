class API {
  String _url = 'http://tluplus.duongphung.com/';

  String login(String msv, String pass) {
    return _url + 'dang-nhap.php?msv=$msv&pass=$pass';
  }

  String lichHoc(String msv, String pass) {
    return _url + 'lich-hoc.php?msv=$msv&pass=$pass';
  }
}
