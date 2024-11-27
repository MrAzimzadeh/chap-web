import 'package:chapweb/presenter/themes/colors.dart';
import 'package:chapweb/presenter/themes/styles.dart';
import 'package:chapweb/presenter/themes/themes.dart';
import 'package:flutter/material.dart';

class LightAppTheme extends AppTheme {
  // Const Silinmemelidir
  const LightAppTheme()
      : super(
          name: "Light",
          brightness: Brightness.light,
          colors: const AppThemeColors(
            primarySwatch: Colors.blue,
            primary: Colors.blue,
            secondary: Colors.blue,
            accent: Colors.blue,
            background: AppColors.darkBackgound, // Todo Light Mode
            backgroundDark: Colors.white,
            disabled: Colors.grey,
            information: Colors.blue,
            success: Colors.green,
            alert: Colors.red,
            warning: Colors.orange,
            error: Colors.red,
            text: Colors.black,
            textOnPrimary: Colors.white,
            border: Colors.grey,
            hint: Colors.grey,
            
          ),
          styles: const AppThemeStyles(
            cardShadow: [
              BoxShadow(
                color: Color(0x4D000000),
                offset: Offset(0, 8),
                blurRadius: 23,
              ),
              
            ],
          ),
        
        );
}
