part of '/dart_extensions.dart';

/// convert SizedBox height/width to percents.
extension SizedBoxExt on SizedBox {
  SizedBox toPercents(BuildContext context) {
    if (this.width != null) return SizedBox(width: (this.width ?? 0 / context.width) * 1000);
    if (this.height != null) return SizedBox(height: (this.height ?? 0 / context.height) * 1000);
    return SizedBox.shrink();
  }
}

/// Generate SizedBox from number
extension NumSizedBoxExt on num {
  SizedBox get widthBox => SizedBox(width: this.toDouble());
  SizedBox get heightBox => SizedBox(height: this.toDouble());
}
