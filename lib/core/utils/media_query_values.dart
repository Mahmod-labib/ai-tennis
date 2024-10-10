import 'package:flutter/widgets.dart';

extension MediaQueryValues on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  double get screenAspectRatio => screenSize.aspectRatio;
  double get screenOrientation => MediaQuery.of(this).orientation == Orientation.portrait ? screenHeight : screenWidth;
  double get topPadding => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  double get safeAreaHeight => screenHeight - topPadding - bottomPadding;
}