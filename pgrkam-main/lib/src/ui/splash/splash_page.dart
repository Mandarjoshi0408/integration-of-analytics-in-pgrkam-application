import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routing/router.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToMainPageAfterDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 105),
            Image.asset(
              'assets/images/logo.png',
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'PUNJAB GHAR GHAR ROZGAR\nDepartment of Employment Generation,\nSkill Development & Training- Govt. Of Punjab, India',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: 15,
                  // color: Colors.orange,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'PGRKAM App',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: 25,
                  // color: Colors.orange,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Center(
              child: Text(
                'Loading...',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.4,
                  color: Colors.green[900],
                ),
              ),
            ),
            const SizedBox(
              height: 85,
            ),
          ],
        ),
      ),
    );
  }

  /// navigates the user to Main page after a delay
  _navigateToMainPageAfterDelay() async {
    final router = context.router;

    await Future.delayed(const Duration(milliseconds: 2000));
    router.replace(const MainRoute());
  }
}
