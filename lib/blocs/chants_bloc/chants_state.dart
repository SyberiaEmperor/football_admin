part of 'chants_bloc.dart';

abstract class ChantsState extends Equatable {
  final BlocKey blocKey;
  const ChantsState(this.blocKey);

  @override
  List<Object> get props => [];
}

class ChantsInitial extends ChantsState {
  ChantsInitial(BlocKey blocKey) : super(blocKey);
}
