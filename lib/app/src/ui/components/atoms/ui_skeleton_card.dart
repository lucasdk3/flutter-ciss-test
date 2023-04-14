// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../../../../../../ciss_test_exports.dart';

enum SkeletonType { TYPE1, TYPE2 }

class UiSkeletonCard extends StatelessWidget {
  final SkeletonType type;
  final Widget? shimmer;
  const UiSkeletonCard({
    Key? key,
    this.type = SkeletonType.TYPE2,
    this.shimmer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: _getSkeleton(context),
    );
  }

  Widget _getSkeleton(BuildContext context) {
    if (type == SkeletonType.TYPE1) {
      return shimmer ??
          SizedBox(
            height: 80,
            width: context.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16,
                  width: 221,
                  decoration: BoxDecoration(
                    color: ThemeService.colors.terciary,
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(9)),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 80,
                  width: 130,
                  decoration: BoxDecoration(
                    color: ThemeService.colors.terciary,
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(9)),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 80,
                  width: 89,
                  decoration: BoxDecoration(
                    color: ThemeService.colors.terciary,
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(9)),
                  ),
                ),
              ],
            ),
          );
    } else {
      return shimmer ??
          Row(
            children: [
              ClipOval(
                child: Container(
                  color: ThemeService.colors.terciary,
                  height: 50,
                  width: 64,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 221,
                    decoration: BoxDecoration(
                      color: ThemeService.colors.terciary,
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                      color: ThemeService.colors.terciary,
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                    ),
                  ),
                  const SizedBox(height: 2),
                ],
              )),
            ],
          );
    }
  }
}
