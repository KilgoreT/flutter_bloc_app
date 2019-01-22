import 'package:flutter_bloc_app/src/models/ipModel.dart';
import 'package:flutter_bloc_app/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class IpBlock {
  final _repository = Repository();
  final _ipFetcher = PublishSubject<IpModel>();

  Observable<IpModel> get ipModels => _ipFetcher.stream.delay(new Duration(seconds: 5));

  fetchAllIp() async {
    IpModel ipModel = await _repository.fetchIp();
    _ipFetcher
        .sink
        .add(ipModel);
  }

  dispose() {
    _ipFetcher.close();
  }
}

final ipBloc = IpBlock();