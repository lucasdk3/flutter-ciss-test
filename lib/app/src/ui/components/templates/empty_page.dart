import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../ciss_test_exports.dart';

class EmptyPage extends StatelessWidget {
  final String? emptyText;
  const EmptyPage({super.key, required this.emptyText});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: ThemeService.colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          height: 90,
          width: double.infinity,
          child: Center(
            child: AutoSizeText(
              emptyText ?? '',
              style: ThemeService.styles.ralewayDanger(),
            ),
          ),
        ));
  }
}
