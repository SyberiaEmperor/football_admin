import 'dart:async';

class MatchStream {
  static final StreamController<int> matchStream = StreamController<int>.broadcast();
}
