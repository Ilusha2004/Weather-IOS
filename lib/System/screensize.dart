import 'package:flutter/widgets.dart';

class ScreenSize {
  static ScreenSize _instance = ScreenSize._internal();
  MediaQueryData _mediaQueryData = MediaQueryData();

  factory ScreenSize() {
    return _instance;
  }

  ScreenSize._internal() {
    _mediaQueryData = MediaQueryData();
  }

  void update(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
  }

  double get screenWidth => _mediaQueryData.size.width;
  double get screenHeight => _mediaQueryData.size.height;
  double get devicePixelRatio => _mediaQueryData.devicePixelRatio;
  bool get isLandscape => _mediaQueryData.orientation == Orientation.landscape;
}