import 'package:flutter/widgets.dart';

class ResponsiveResize {
  ResponsiveResize(this.query);

  final MediaQueryData query;

  static ResponsiveResize of(BuildContext context) {
    return new ResponsiveResize(MediaQuery.of(context));
  }

  double responsiveWidth({@required double widthFactor, double minWidth, double maxWidth}) {
    if (widthFactor > 1 || widthFactor < 0) {
      throw Exception("widthFactor has to be <= 1 or > 0");
    }
    return _calculate(size: query.size.width * widthFactor, min: minWidth, max: maxWidth);
  }

  double responsiveHeight({@required double heightFactor, double minHeight, double maxHeight}) {
    if (heightFactor > 1 || heightFactor < 0) {
      throw Exception("heightFactor has to be <= 1 or > 0");
    }
    return _calculate(size: query.size.height * heightFactor, min: minHeight, max: maxHeight);
  }


  double _calculate({@required double size, double min, double max}) {
    if (max != null) {
      if (max < size) {
        return max;
      }
    }

    if (min != null) {
      if (min > size) {
        return min;
      }
    }

    return size;
  }
}
