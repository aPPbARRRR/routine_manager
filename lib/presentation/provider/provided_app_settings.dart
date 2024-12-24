import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:window_manager/window_manager.dart';
import 'state/app_settings.dart';

part 'provided_app_settings.g.dart';

@Riverpod(keepAlive: true)
class ProvidedAppSettings extends _$ProvidedAppSettings {
  @override
  AppSettings build() {
    return AppSettings(isAlwaysOnTop: false);
  }

  void toggleAlwaysOnTop() async {
    await windowManager.setAlwaysOnTop(state.isAlwaysOnTop);
    state = state.copyWith(isAlwaysOnTop: !state.isAlwaysOnTop);
  }
}
