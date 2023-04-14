import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../ciss_test_exports.dart';

class UiSkeletonList extends StatelessWidget {
  final Widget? child;
  final bool enable;
  final int length;
  const UiSkeletonList(
      {Key? key, this.child, required this.enable, this.length = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ThemeService.colors.terciary,
      highlightColor: ThemeService.colors.terciary,
      enabled: enable,
      child: Column(
          children: List.generate(
        length != 0 ? length : 1,
        (index) => UiSkeletonCard(shimmer: child),
      )),
    );
  }
}
