part of '/dart_extensions.dart';

extension ThemeExtensions on BuildContext {
  /// performs a simple [Theme.of(context)] action and returns given [theme]
  ThemeData get theme => Theme.of(this);

  /// performs a simple [Theme.of(context)] action and returns given [textTheme]
  TextTheme get textTheme => theme.textTheme;

  /// performs a simple [Theme.of(context)] action and returns given [colorScheme]
  ColorScheme get colorScheme => theme.colorScheme;

  /// performs a simple [Theme.of(context).primaryTextTheme] action and returns given [primaryTextTheme]
  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  /// performs a simple [Theme.of(context).bottomAppBarTheme] action and returns given [bottomAppBarTheme]
  BottomAppBarTheme get bottomAppBarTheme => theme.bottomAppBarTheme;

  /// performs a simple [Theme.of(context).bottomSheetTheme] action and returns given [bottomSheetTheme]
  BottomSheetThemeData get bottomSheetTheme => theme.bottomSheetTheme;

  /// performs a simple [Theme.of(context).appBarTheme] action and returns given [appBarTheme]
  AppBarTheme get appBarTheme => theme.appBarTheme;

  /// performs a simple [Theme.of(context).backgroundColor] action and returns given [backgroundColor]
  Color get backgroundColor => colorScheme.background;

  /// performs a simple [Theme.of(context).primaryColor] action and returns given [primaryColor]
  Color get primaryColor => theme.primaryColor;
}
