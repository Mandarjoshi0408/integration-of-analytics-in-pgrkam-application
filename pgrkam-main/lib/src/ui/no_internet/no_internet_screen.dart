import 'package:auto_route/auto_route.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/repositories/auth_repository/auth_repository.dart';
import '../../routing/router.dart';
import '../../utils/network_utils.dart';
import '../widgets/progress_indicator.dart';

@RoutePage()
class NoInternetPage extends ConsumerStatefulWidget {
  const NoInternetPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _NoInternetPageState();
}

class _NoInternetPageState extends ConsumerState<NoInternetPage> {
  bool isProcessing = false;

  retry() async {
    setState(() => isProcessing = true);
    final hasInternet = await hasInternetAccess();
    if (hasInternet! && mounted) {
      ref.read(authRepositoryProvider.notifier).setInternetConnectedStatus();
      context.replaceRoute(const MainRoute());
      return;
    }

    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (mounted) {
          setState(() => isProcessing = false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/winner.webp',
                height: 60,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'No Internet',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 18.5,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.0,
                color: const Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'please check connection!',
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w400,
                fontSize: 13.5,
                letterSpacing: 0.2,
                color: const Color(0xFF666666),
              ),
            ),
            const SizedBox(height: 25),
            isProcessing
                ? const CustomProgressIndicator()
                : CupertinoButton(
                    onPressed: retry,
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 46,
                      width: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00A36C),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'RELOAD',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 13.5,
                            letterSpacing: 0.4,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
