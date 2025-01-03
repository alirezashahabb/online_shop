import 'package:flutter/material.dart';

ThemeData lightThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: AppColors.kRed2,
      onPrimary: Colors.white,
    ),
    fontFamily: 'Vazir',
    platform: TargetPlatform.iOS,
    textTheme: const TextTheme(
        displayMedium: TextStyle(
          fontSize: 16,
          color: AppColors.kBlack5,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.kBlack5,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: AppColors.kBlack5,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          color: AppColors.kGray3,
        )),
  );
}

class AppColors {
  // White colors
  static const kPrimaryColor = Color(0xFFFFFFFF);
  static const kSecondaryColor = Color(0xFFF4F4F4);
  static const kTertiaryColor = Color(0xFFEAEAEA);
  static const kQuaternaryColor = Color(0xFFDFDFDF);
  static const kQuinaryColor = Color(0xFFD4D4D4);

// Gray colors
  static const kGray1 = Color(0xFFBFBFBF);
  static const kGray2 = Color(0xFFA9A9A9);
  static const kGray3 = Color(0xFF767676);
  static const kGray4 = Color(0xFF949494);
  static const kGray5 = Color(0xFF595959);

// Black colors
  static const kBlack1 = Color(0xFF3B3B3B);
  static const kBlack2 = Color(0xFF2C2C2C);
  static const kBlack3 = Color(0xFF1E1E1E);
  static const kBlack4 = Color(0xFF000000);
  static const kBlack5 = Color(0xFF0F0F0F);

// Red colors
  static const kRed1 = Color(0xFFF02424);
  static const kRed2 = Color(0xFFC01D1D);
  static const kRed3 = Color(0xFF901616);
  static const kRed4 = Color(0xFFF35050);
  static const kRed5 = Color(0xFFF67C7C);

// Blue colors
  static const kBlue1 = Color(0xFF80BAF7);
  static const kBlue2 = Color(0xFF56A3F5);
  static const kBlue3 = Color(0xFF2370C2);
  static const kBlue4 = Color(0xFF2C8CF2);
  static const kBlue5 = Color(0xFFABD1FA);

// Green colors
  static const kGreen1 = Color(0xFFD6F9DC);
  static const kGreen2 = Color(0xFF29B440);
  static const kGreen3 = Color(0xFF1F8730);
  static const kGreen4 = Color(0xFF33E150);
  static const kGreen5 = Color(0xFFC2F6CA);

// Orange colors
  static const kOrange1 = Color(0xFFF36234);
  static const kOrange2 = Color(0xFFF5815D);
  static const kOrange3 = Color(0xFFFAC0AE);
  static const kOrange4 = Color(0xFFFDAD51);
  static const kOrange5 = Color(0xFFCA7A1E);

// Pink colors
  static const kPink1 = Color(0xFFF8A185);
  static const kPink2 = Color(0xFFFBD0C2);
  static const kPink3 = Color(0xFFFABDBD);
  static const kPink4 = Color(0xFFFDE9E9);
  static const kPink5 = Color(0xFFFAC0AE);

// Yellow colors
  static const kYellow1 = Color(0xFFFFF5E9);
  static const kYellow2 = Color(0xFFFEEFEB);
  static const kYellow3 = Color(0xFFFFEBD4);

// Mixed colors
  static const kMixed1 = Color(0xFFEAF3FE);
  static const kMixed2 = Color(0xFFEBFCED);
  static const kMixed3 = Color(0xFFADF3B9);
  static const kMixed4 = Color(0xFFD5E8FC);
  static const kMixed5 = Color(0xFF85ED96);
}
