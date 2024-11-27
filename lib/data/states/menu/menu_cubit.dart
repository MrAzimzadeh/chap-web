import 'package:bloc/bloc.dart';
import 'package:chapweb/presenter/models/menu_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_state.dart';
part 'menu_cubit.freezed.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(const MenuState.initial());
  void loadMenuItems() {
    final menuItems = [
      MenuItem(
        key: 'home',
        title: 'sad',
        route: '/home',
        isSelected: true,
      ),
      MenuItem(
        key: 'about',
        title: 'About',
        route: '/about',
        isSelected: false,
      ),
      MenuItem(
        key: 'contact',
        title: 'Contact',
        route: '/contact',
        isSelected: false,
      ),
      MenuItem(
        key: 'service',
        title: 'Services',
        route: '/services',
      ),
      MenuItem(
        key: 'blog',
        title: 'Blog',
        route: '/blog',
      ),
    ];
    emit(MenuState.loaded(menuItems));
  }

  void selectMenuItem(MenuItem selectedItem) {
    // matveWhen o demekdir ki eger state loaded olarsa onda bu ishleri et
    state.maybeWhen(
      loaded: (menuItems) {
        final updatedItems = menuItems.map((item) {
          return item.title == selectedItem.title
              ? item.copyWith(isSelected: true)
              : item.copyWith(isSelected: false);
        }).toList();
        emit(MenuState.loaded(updatedItems));
      },
      orElse: () {},
    );
  }
}
