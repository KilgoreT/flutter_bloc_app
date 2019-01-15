import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/src/models/ipModel.dart';
import '../blocs/ip_block.dart';

class MovieList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllIp();
    return Scaffold(
      appBar: AppBar(
        title: Text('Ip'),
      ),
      body: StreamBuilder(
        stream: bloc.ipModels,
          builder: (context, AsyncSnapshot<IpModel> snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text(snapshot.data.ip),
              );
            } else if(snapshot.hasError) {
              return Center(
                child: Text('nothing'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
      ),
    );
  }

}