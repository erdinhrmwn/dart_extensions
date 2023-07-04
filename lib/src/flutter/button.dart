part of '/dart_extensions.dart';

extension ButtonExtensions<T extends ElevatedButton> on T {
  ElevatedButton copyWith({
    Key? key,
    ButtonStyle? style,
  }) =>
      ElevatedButton(
        key: key ?? this.key,
        onPressed: this.onPressed,
        style: style ?? this.style,
        child: this.child,
      );

  ButtonStyle merge({Key? key, ButtonStyle? style}) => (this.style ?? ButtonStyle()).merge(style ?? this.style);

  T withPadding({EdgeInsetsGeometry? padding}) => this.copyWith(
        style: ElevatedButton.styleFrom(
          padding: padding,
        ),
      ) as T;
}
