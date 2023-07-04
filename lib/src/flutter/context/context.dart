part of '/dart_extensions.dart';

extension ContextExtensions on BuildContext {
  // Returns the MediaQuery
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns same as [MediaQuery.of(context).size]
  Orientation get orientation => MediaQuery.orientationOf(this);

  /// Returns if Orientation is landscape
  bool get isLandscape => orientation == Orientation.landscape;

  /// Returns if Orientation is portrait
  bool get isPortrait => orientation == Orientation.portrait;

  /// Returns same as [MediaQuery.of(context).size]
  Size get mediaQuerySize => MediaQuery.sizeOf(this);

  /// Returns same as [MediaQuery.of(context).padding]
  EdgeInsets get padding => MediaQuery.paddingOf(this);

  /// Returns same as [MediaQuery.of(context).viewPadding]
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  /// Returns same as [MediaQuery.of(context).viewInsets]
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  /// Returns same as [MediaQuery.of(context).size.width]
  double get width => mediaQuerySize.width;

  /// Returns same as [MediaQuery.of(context).size.height]
  double get height => mediaQuerySize.height;

  /// Returns same as [MediaQuery.of(context).brightness]
  Brightness get brightness => MediaQuery.platformBrightnessOf(this);

  /// Returns same as [MediaQuery.of(context).devicePixelRatio]
  double get pixelRatio => MediaQuery.devicePixelRatioOf(this);
}
