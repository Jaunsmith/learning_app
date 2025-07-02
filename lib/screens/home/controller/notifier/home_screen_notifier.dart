import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen_notifier.g.dart'; // ✅ must match this file's name

// in other to make the state keep alive meaining the state you left the app want to meet it there after you leave the page and come back you do it like this
@Riverpod(keepAlive: true)
class HomeScreenSliderIndexNotifier extends _$HomeScreenSliderIndexNotifier {
  @override
  int build() {
    return 0;
  }

  void getIndex(int value) {
    state = value;
  }
}
