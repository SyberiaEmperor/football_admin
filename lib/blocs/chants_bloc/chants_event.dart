part of 'chants_bloc.dart';

abstract class ChantsEvent extends Equatable {
  const ChantsEvent();

  @override
  List<Object> get props => [];
}

class LoadChants extends ChantsEvent {}

class StartChant extends ChantsEvent {
  final int chantId;

  StartChant(this.chantId);
  @override
  List<Object> get props => [chantId];
}
