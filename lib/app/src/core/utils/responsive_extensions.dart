// coverage:ignore-file
import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  double get width {
    final context = this;
    return MediaQuery.of(context).size.width;
  }

  double get height {
    final context = this;
    return MediaQuery.of(context).size.height;
  }

  bool get isMobile {
    final context = this;
    return context.width <= 800;
  }

  bool get isDesktop {
    final context = this;
    return context.width > 800;
  }
}
