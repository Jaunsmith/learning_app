import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_nav_notifier.g.dart';

@riverpod
class BottomNavNotifier extends _$BottomNavNotifier {
  @override
  int build() {
    return 0;
  }

  void getIndex(int index) {
    state = index;
  }
}
