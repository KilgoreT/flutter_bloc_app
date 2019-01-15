
import 'dart:async';
import 'package:flutter_bloc_app/src/models/ipModel.dart';
import 'package:flutter_bloc_app/src/resources/ip_api_provider.dart';

class Repository {
  final ipApiProvider = IpApiProvider();

  Future<IpModel> fetchIp() => ipApiProvider.fetchIp();

}