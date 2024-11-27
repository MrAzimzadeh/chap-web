import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chapweb/data/states/menu/menu_cubit.dart';
import 'package:chapweb/presenter/assets.gen.dart';
import 'package:chapweb/presenter/models/menu_item.dart';
import 'package:chapweb/presenter/themes/colors.dart';
import 'package:chapweb/presenter/themes/extensions.dart';
import 'package:chapweb/presenter/themes/styles.dart';
import 'package:chapweb/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppAppBar extends AppBar {
  static const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 0);

  AppAppBar({
    super.key,
    super.title,
    super.foregroundColor,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTrailingPressed,
  }) : super(
          leading: leading ?? const AppBarBackButton(),
          actions: <Widget>[
            if (trailing != null)
              AppBarButton(
                onPressed: onTrailingPressed,
                icon: trailing,
              ),
          ],
        );
}

class AppExpandableSliverAppBar extends SliverAppBar {
  static const BorderRadius _borderRadius =
      BorderRadius.vertical(bottom: Radius.circular(30));

  AppExpandableSliverAppBar({
    super.floating = true,
    super.pinned = true,
    super.primary = true,
    super.shape = const RoundedRectangleBorder(borderRadius: _borderRadius),
    super.actions,
    super.automaticallyImplyLeading,
    super.backgroundColor,
    super.bottom,
    super.centerTitle,
    super.collapsedHeight,
    super.elevation,
    super.excludeHeaderSemantics,
    super.iconTheme,
    super.actionsIconTheme,
    super.forceElevated,
    super.key,
    super.leading,
    super.shadowColor,
    super.snap,
    super.stretch,
    super.toolbarHeight,
    super.toolbarTextStyle,
    super.clipBehavior,
    super.forceMaterialTransparency,
    super.foregroundColor,
    super.leadingWidth,
    super.onStretchTrigger,
    super.scrolledUnderElevation,
    super.stretchTriggerOffset,
    super.surfaceTintColor,
    super.systemOverlayStyle,
    Widget title = const SizedBox.shrink(),
    PreferredSizeWidget? background,
  }) : super(
          expandedHeight: background?.preferredSize.height,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            title: title,
            titlePadding: const EdgeInsets.symmetric(vertical: 16),
            background: ClipRRect(
              borderRadius: _borderRadius,
              child: background,
            ),
          ),
        );
}

class AppMovingTitleSliverAppBar extends SliverAppBar {
  static const TextStyle _textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: kToolbarHeight / 3,
    height: 1,
  );

  AppMovingTitleSliverAppBar({
    super.key,
    GlobalKey? appBarKey,
    String title = 'Pokedex',
    double height = kToolbarHeight + 48,
    double expandedFontSize = 30,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTrailingPressed,
  }) : super(
          expandedHeight: height,
          pinned: true,
          backgroundColor: Colors.transparent,
          leading: leading ?? const AppBarBackButton(),
          actions: [
            if (trailing != null)
              AppBarButton(
                onPressed: onTrailingPressed,
                icon: trailing,
              ),
          ],
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              final safeAreaTop = MediaQuery.paddingOf(context).top;
              final minHeight = safeAreaTop + kToolbarHeight;
              final maxHeight = height + safeAreaTop;

              final percent =
                  (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
              final fontSize = _textStyle.fontSize ?? 16;
              final currentTextStyle = _textStyle.copyWith(
                fontSize: fontSize + (expandedFontSize - fontSize) * percent,
              );

              final textWidth =
                  getTextSize(context, title, currentTextStyle).width;
              final startX = AppAppBar.padding.left;
              final endX =
                  MediaQuery.sizeOf(context).width / 2 - textWidth / 2 - startX;
              final dx = startX + endX - endX * percent;

              return Container(
                color:
                    context.colors.background.withOpacity(0.8 - percent * 0.8),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: kToolbarHeight / 3),
                      child: Transform.translate(
                        offset:
                            Offset(dx, constraints.maxHeight - kToolbarHeight),
                        child: Text(
                          title,
                          style: currentTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
}

class AppBarButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const AppBarButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: AppAppBar.padding,
      onPressed: onPressed,
      icon: icon,
    );
  }
}

class AppBarBackButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const AppBarBackButton({
    super.key,
    this.icon = const Icon(Icons.arrow_back_rounded, color: Colors.white),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (!context.router.canPop()) {
      return const SizedBox.shrink();
    }

    return IconButton(
      padding: AppAppBar.padding,
      onPressed: onPressed ?? context.router.maybePop,
      icon: icon,
    );
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  static const double toolbarHeight = 150;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit()..loadMenuItems(),
      child: AppBar(
        actions: const [
          LogoWidget(),
          Expanded(child: MenuItemsWidget()),
          StartButtonWidget(
            title: 'Start',
          ),
        ],
        toolbarHeight: toolbarHeight,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeight);
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        left: mediaQuery.width * 0.1,
        top: 100,
        right: mediaQuery.width * 0.1,
      ),
      child: CachedNetworkImage(
        imageUrl: Assets.images.logo.path,
        width: 82,
        height: 39,
        useOldImageOnUrlChange: true,
        fit: BoxFit.contain,
        alignment: Alignment.topCenter,
        placeholder: (context, url) => Image(
          image: Assets.images.logo.provider(),
          width: 82,
          height: 39,
          color: Colors.black12,
        ),
        errorWidget: (_, __, error) => Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: Assets.images.logo.provider(),
              width: 82,
              height: 39,
              color: Colors.black12,
            ),
            const Icon(
              Icons.warning_amber_rounded,
              size: 82 * 0.4,
              color: Colors.black45,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemsWidget extends StatelessWidget {
  const MenuItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 77),
      child: BlocBuilder<MenuCubit, MenuState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.maybeWhen(
              loaded: (menuItems) => menuItems.length,
              orElse: () => 0,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              MenuItem menuItem = state.maybeWhen(
                loaded: (menuItems) => menuItems[index],
                orElse: () => MenuItem(
                  key: 'home',
                  title: 'Home',
                  route: '/home',
                  isSelected: true,
                ),
              );
              menuItem = _localizeMenuItem(context, menuItem);

              return MenuItemButton(
                  menuItem: menuItem,
                  buttonStyle: _buttonStyle(),
                  marginRight: 20);
            },
          );
        },
      ),
    );
  }

  MenuItem _localizeMenuItem(BuildContext context, MenuItem menuItem) {
    switch (menuItem.key) {
      case 'home':
        return menuItem.copyWith(title: AppLocalizations.of(context).home);
      case 'about':
        return menuItem.copyWith(title: AppLocalizations.of(context).about);
      case 'contact':
        return menuItem.copyWith(title: AppLocalizations.of(context).contact);
      case 'service':
        return menuItem.copyWith(title: AppLocalizations.of(context).services);
      case 'blog':
        return menuItem.copyWith(title: AppLocalizations.of(context).blog);
      default:
        return menuItem;
    }
  }

  ButtonStyle _buttonStyle() {
    return const AppThemeStyles().menuButtonStyle;
  }
}

class MenuItemButton extends StatelessWidget {
  final MenuItem menuItem;
  final ButtonStyle buttonStyle;
  final double marginRight;

  const MenuItemButton({
    Key? key,
    required this.menuItem,
    required this.buttonStyle,
    required this.marginRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29,
      width: 101,
      margin: EdgeInsets.only(
        right: marginRight,
      ),
      child: ElevatedButton(
        onPressed: () {
          context.read<MenuCubit>().selectMenuItem(menuItem);
        },
        style: buttonStyle,
        child: Text(
          menuItem.title,
          style: GoogleFonts.hind(
            color: menuItem.isSelected ? AppColors.buttonBgColor : Colors.grey,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class StartButtonWidget extends StatelessWidget {
  const StartButtonWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        right: mediaQuery.width * 0.12,
        top: 81,
      ),
      child: ButtonTheme(
        minWidth: 139,
        child: ElevatedButton(
          onPressed: () {
            debugPrint('Started');
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          ),
          child: Text(
            title,
            style: GoogleFonts.hind(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
