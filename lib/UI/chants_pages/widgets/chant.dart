import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app_admin/blocs/chants_bloc/chants_bloc.dart';
import 'package:football_app_admin/models/chants.dart' as model;

class Chant extends StatelessWidget {
  final model.Chants chant;

  const Chant({Key key, this.chant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 50, //TODO: Adaptive
            height: 150,
            child: Text(
              chant.body, //TODO: Style
            ),
          ),
          /*FloatingActionButton.extended(
            label: Text('Начать кричалку'),
            onPressed: () =>
                BlocProvider.of<ChantsBloc>(context).add(StartChant(chant.id)),
          ),*/
        ],
      ),
    );
  }
}
