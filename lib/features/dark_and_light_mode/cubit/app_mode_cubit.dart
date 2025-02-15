import 'package:bloc/bloc.dart';
import 'package:holo_cart/features/dark_and_light_mode/app_states.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_mode_state.dart';

class AppModeCubit extends Cubit<AppModeState> {
  AppModeCubit() : super(AppModeInitial());

  Future<SharedPreferences> _getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  void changeAppMode(ThemeState themeState) async {
    final sharedPreferences = await _getSharedPreferences();

    if (themeState == ThemeState.init) {
      final savedTheme = sharedPreferences.getString('theme');
      if (savedTheme == 'light') {
        emit(AppModeLight());
      } else {
        emit(AppModeDark());
      }
    } else {
      final themeString = themeState == ThemeState.dark ? 'dark' : 'light';
      await sharedPreferences.setString('theme', themeString);

      if (themeState == ThemeState.dark) {
        emit(AppModeDark());
      } else {
        emit(AppModeLight());
      }
    }
  }
}
