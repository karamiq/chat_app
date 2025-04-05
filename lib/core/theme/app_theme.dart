import 'package:app/core/theme/extra_colors.dart';

import '../constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'extra_colors.dart';

class AppTheme {
  ThemeData _build(Brightness brightness) {
    final themeData = ThemeData(
      useMaterial3: false,
      brightness: brightness,
      scaffoldBackgroundColor: brightness == Brightness.light
          ? const Color(0xffF5F5F5)
          : const Color(0xff121212),
      extensions: [buildExtraColors(brightness)],
      inputDecorationTheme: _buildInputDecorationTheme(brightness),
      colorScheme: _buildColorScheme(brightness),
      filledButtonTheme: _buildFilledButtonTheme(brightness),
      outlinedButtonTheme: _buildOutlinedButtonTheme(brightness),
      textButtonTheme: _buildTextButtonTheme(brightness),
      elevatedButtonTheme: _buildElevatedButtonTheme(brightness),
      //fontFamily: 'Tajawal',
      fontFamily: GoogleFonts.cairo().fontFamily,

      //This effect the colors & them of the fonts when dark or light mode
      //textTheme: _buildTextTheme(GoogleFonts.cairoTextTheme()),
    );

    return themeData;
  }

  final borderRadius = BorderRadius.circular(BorderSize.extraSmall);
  final padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 14);

  Brightness getBrightness() {
    return currentBrightness.value;
  }

  final currentBrightness = ValueNotifier<Brightness>(Brightness.light);

  ThemeData buildDarkTheme() {
    currentBrightness.value = Brightness.dark;
    return _build(Brightness.dark);
  }

  ThemeData buildLightTheme() {
    currentBrightness.value = Brightness.light;
    return _build(Brightness.light);
  }

  InputDecorationTheme _buildInputDecorationTheme(Brightness brightness) {
    final colorScheme = _buildColorScheme(brightness);

    OutlineInputBorder buildBorder(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return InputDecorationTheme(
      contentPadding: padding,
      fillColor: colorScheme.surfaceContainerHighest.withOpacity(0.5),
      filled: false,
      activeIndicatorBorder: BorderSide.none,
      border: buildBorder(Colors.black),
      errorBorder: buildBorder(colorScheme.error),
      enabledBorder: buildBorder(Colors.black),
      focusedBorder: buildBorder(colorScheme.primary),
      focusedErrorBorder: buildBorder(colorScheme.error, width: 3),
      disabledBorder: buildBorder(colorScheme.outline.withOpacity(0.5)),
    );
  }

  TextTheme _buildTextTheme(TextTheme textTheme) {
    return GoogleFonts.cairoTextTheme(textTheme);
  }

  ExtraColors buildExtraColors(Brightness brightness) {
    final colorScheme = _buildColorScheme(brightness);
    return ExtraColors(
      success: Color.fromARGB(255, 28, 101, 30),
      onSuccess: colorScheme.primary,
      error: Color.fromARGB(255, 255, 0, 0),
    );
  }

  ColorScheme _buildColorScheme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      // ignore: use_full_hex_values_for_flutter_colors
      seedColor: Colors.blueAccent,

      brightness: brightness,
    );

    return colorScheme.copyWith(outline: colorScheme.outline.withOpacity(0.5));
  }

  FilledButtonThemeData _buildFilledButtonTheme(Brightness brightness) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 60),
        maximumSize: const Size(double.infinity, double.infinity),
        // padding: padding,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        backgroundColor: const Color(0xffB83B40),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Tajawal',
        ),
      ),
    );
  }

  OutlinedButtonThemeData _buildOutlinedButtonTheme(Brightness brightness) {
    final colorScheme = _buildColorScheme(brightness);
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        padding: padding,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: BorderSide(width: 2, color: colorScheme.primary)),
        side: BorderSide(
          width: 1.5,
          color: colorScheme.primary,
        ),
      ),
    );
  }

  TextButtonThemeData _buildTextButtonTheme(Brightness brightness) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    );
  }

  ElevatedButtonThemeData _buildElevatedButtonTheme(Brightness brightness) {
    final colorScheme = _buildColorScheme(brightness);

    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        minimumSize: const Size(double.infinity, 50),
        disabledForegroundColor: colorScheme.onPrimary,
        foregroundColor: colorScheme.onPrimary,
        disabledBackgroundColor:
            colorScheme.primary.withAlpha((0.5 * 255).toInt()),
        backgroundColor:
            colorScheme.primary, // Use primary color from color scheme

        shape:
            RoundedRectangleBorder(borderRadius: BorderSize.extraSmallRadius),
      ),
    );
  }
}

final colorSchemeNotifier = ValueNotifier<ColorScheme>(
  ColorScheme.fromSeed(
    seedColor: const Color(0xffA81016),
    brightness: AppTheme().getBrightness(),
  ),
);
