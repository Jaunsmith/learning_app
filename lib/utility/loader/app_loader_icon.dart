import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_loader_icon.g.dart';

@riverpod
class AppLoaderIcon extends _$AppLoaderIcon {
  @override
  bool build() {
    return false;
  }

  void setLoaderValue(bool valueState) {
    state = valueState;
  }
}
