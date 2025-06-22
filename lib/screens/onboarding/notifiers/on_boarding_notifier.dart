import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'on_boarding_notifier.g.dart';

@riverpod
class IndexDot extends _$IndexDot {
  @override
  int build() {
    return 0;
  }

  void updateIndex(int index) {
    state = index;
  }
}

// this code help us in auto generating a riverpod code and with it helping us with auto state to use based on the data type given
