import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:football_app_admin/helpers/requests.dart';
import 'package:football_app_admin/models/bloc_key.dart';
import 'package:football_app_admin/models/chants.dart';

part 'chants_event.dart';
part 'chants_state.dart';

class ChantsBloc extends Bloc<ChantsEvent, ChantsState> {
  List<Chants> chants = new List<Chants>();
  ChantsBloc()
      : super(
          ChantsInitial(BlocKey()),
        );

  @override
  Stream<ChantsState> mapEventToState(
    ChantsEvent event,
  ) async* {
    if (event is LoadChants) {
      chants = await Requests.getChants();
      yield ChantsInitial(new BlocKey());
    }
  }
}
