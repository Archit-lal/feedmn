import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: _appBarTheme,
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      filledButtonTheme: _filledButtonTheme,
      textButtonTheme: _textButtonTheme,
      dividerTheme: _dividerTheme,
    );
  }

static ColorScheme get _colorScheme {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.black, // Primary color set to black
    onPrimary: Colors.white, // Text/icons on primary color set to white
    primaryContainer: Color(0xff1a1a1a), // Slightly lighter black for container
    onPrimaryContainer: Colors.black, // Text/icons on primary container set to black
    secondary: Color(0xff008080), // Teal color for secondary
    onSecondary: Colors.white, // Text/icons on secondary color set to white
    secondaryContainer: Color(0xff004c4c), // Darker teal for container
    tertiary: Color(0xff00b3b3), // Light teal for tertiary
    tertiaryContainer: Colors.white, // Tertiary container set to white
    errorContainer: Color(0xffb71c1c), // Error color set to a deep red
    onErrorContainer: Colors.white, // Text/icons on error container set to white
    surfaceContainerHighest: Color(0xff121212), // Dark surface container for highest layer
    outline: Color(0xffb0b0b0), // Light grey outline
    outlineVariant: Color(0xff00b3b3), // Teal outline for variant
    inverseSurface: Color(0xff121212), // Inverse surface set to dark
    surfaceTint: Color(0xff008080), // Surface tint matching teal
    error: Color(0xffd32f2f), // Error color
    onError: Colors.white, // Text/icons on error color set to white
    surface: Color(0xff121212), // Surface color set to dark
    onSurface: Colors.white, // Text/icons on surface color set to white
  );
}

  static TextTheme get _textTheme {
    const textTheme = TextTheme();

    final bodyFont = GoogleFonts.ibmPlexSansTextTheme(textTheme);
    final headingFont = GoogleFonts.syneMonoTextTheme(textTheme);

    return bodyFont.copyWith(
      displayLarge: headingFont.displayLarge,
      displayMedium: headingFont.displayMedium,
      displaySmall: headingFont.displaySmall,
      headlineLarge: headingFont.headlineLarge,
      headlineMedium: headingFont.headlineMedium,
      headlineSmall: headingFont.headlineSmall,
      bodyLarge: bodyFont.bodyLarge,
      bodyMedium: bodyFont.bodyMedium,
      bodySmall: bodyFont.bodySmall,
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
    );
  }

  static DividerThemeData get _dividerTheme {
    return DividerThemeData(color: _colorScheme.surfaceContainerHighest);
  }

  static FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: _textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  static TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: _textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: _colorScheme.surfaceContainerHighest,
      contentPadding: const EdgeInsets.all(8.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: _enabledBorder,
      focusedBorder: _focusedBorder,
      disabledBorder: _disabledBorder,
    );
  }

  static InputBorder get _enabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: const BorderSide(color: Colors.transparent),
      );

  static InputBorder get _focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide.none,
      );

  static InputBorder get _disabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
      );
}
