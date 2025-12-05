import '/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/colors.dart';

import 'utils/color_utils.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    // close the keyboard
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'PGRKAM',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: ColorUtils.generateMaterialColor(primaryColor),
        scaffoldBackgroundColor: scaffoldColor,
        focusColor: primaryColor,
        hoverColor: primaryColor,
        splashColor: primaryColor,
        textTheme: GoogleFonts.outfitTextTheme(),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
