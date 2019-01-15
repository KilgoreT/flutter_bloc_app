import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/ipModel.dart';

class IpApiProvider {

  Client client = Client();

  Future<IpModel> fetchIp() async {
    var result = await client.get('http://ip.jsontest.com/');
    print(result.body.toString());
    if (result.statusCode == 200) {
      return IpModel.fromJson(json.decode(result.body));
    } else {
      throw Exception('Failed');
    }
  }
}