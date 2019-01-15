class IpModel {
  String _ip;

  IpModel.fromJson(Map<String, dynamic> parcedJson) {
    _ip = parcedJson['ip'];
  }

  String get ip => _ip;

  set ip(String value) {
    _ip = value;
  }

}