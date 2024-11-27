part of 'menu_cubit.dart';

@freezed
class MenuState with _$MenuState {
  const factory MenuState.initial() = _Initial;
  const factory MenuState.loaded(List<MenuItem> menuItems) = _Loaded;
}