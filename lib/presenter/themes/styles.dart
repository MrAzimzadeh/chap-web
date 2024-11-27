import 'package:chapweb/presenter/themes/colors.dart';
import 'package:flutter/material.dart';

class AppThemeStyles {
  final List<BoxShadow> cardShadow;

  final ButtonStyle buttonSmall;
  final ButtonStyle buttonMedium;
  final ButtonStyle buttonLarge;
  final ButtonStyle buttonText;
  final ButtonStyle menuButtonStyle;

  const AppThemeStyles({
    this.cardShadow = const [
      BoxShadow(
        color: Color(0x1F000000),
        offset: Offset(0, 8),
        blurRadius: 23,
      ),
    ],
    this.buttonSmall = const ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size.zero),
      padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 4, horizontal: 12)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 12, fontWeight: FontWeight.w500, height: 1.3),
      ),
    ),
    this.buttonMedium = const ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size.zero),
      padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 8, horizontal: 24)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.5),
      ),
    ),
    this.buttonLarge = const ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.buttonBgColor),
      minimumSize: WidgetStatePropertyAll(Size.zero),
      padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.5),
      ),
    ),
    this.buttonText = const ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size.zero),
      backgroundColor: WidgetStatePropertyAll(Colors.transparent),
      padding: WidgetStatePropertyAll(EdgeInsets.zero),
      splashFactory: NoSplash.splashFactory,
      textStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1),
      ),
    ),
    this.menuButtonStyle = const ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(Colors.transparent),
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      backgroundColor: WidgetStatePropertyAll(Colors.transparent),
      elevation: WidgetStatePropertyAll(0),
      alignment: Alignment.center,
      fixedSize: WidgetStatePropertyAll(Size(101, 29)),
      minimumSize: WidgetStatePropertyAll(Size(101, 29)),
      maximumSize: WidgetStatePropertyAll(Size(101, 29)),
      padding: WidgetStatePropertyAll(EdgeInsets.zero),
      animationDuration: Duration(milliseconds: 0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
      ),
      shadowColor: WidgetStatePropertyAll(Colors.transparent),
    ),
  });
}
