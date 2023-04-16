// coverage:ignore-file
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../ciss_test_exports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashBloc = GetIt.I.get<SplashBloc>();
  @override
  void initState() {
    splashBloc.add(SplashInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ThemeService.colors.primary));
    return BlocListener<SplashBloc, SplashState>(
      bloc: splashBloc,
      listener: (context, state) {
        if (state is Authorized) {
          context.go(ConstantsRoutes.todos);
        }
      },
      child: Scaffold(
        backgroundColor: ThemeService.colors.primary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const UiLogo(),
            const SizedBox(height: 60),
            AutoSizeText(ConstantsStrings.title,
                style: ThemeService.styles
                    .ralewayTitle(color: ThemeService.colors.white)),
            const SizedBox(height: 200),
            UiLoading(color: ThemeService.colors.white)
          ],
        ),
      ),
    );
  }
}
