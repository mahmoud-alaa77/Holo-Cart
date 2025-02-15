part of 'app_mode_cubit.dart';

@immutable
sealed class AppModeState {}

final class AppModeInitial extends AppModeState {}

final class AppModeLight extends AppModeState {}

final class AppModeDark extends AppModeState {}
