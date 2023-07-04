part of '/dart_extensions.dart';

extension ContextExtensions on BuildContext {
  // Returns the MediaQuery
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns if Orientation is landscape
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  /// Returns if Orientation is portrait
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  /// Returns same as [MediaQuery.of(context).size]
  Size get mediaQuerySize => mediaQuery.size;

  /// Returns same as [MediaQuery.of(context).padding]
  EdgeInsets get padding => mediaQuery.padding;

  /// Returns same as [MediaQuery.of(context).viewPadding]
  EdgeInsets get viewPadding => mediaQuery.viewPadding;

  /// Returns same as [MediaQuery.of(context).viewInsets]
  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  /// Returns same as [MediaQuery.of(context).size.width]
  double get width => mediaQuerySize.width;

  /// Returns same as [MediaQuery.of(context).size.height]
  double get height => mediaQuerySize.height;
}
