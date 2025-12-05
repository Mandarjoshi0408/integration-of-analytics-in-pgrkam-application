import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/constants/colors.dart';
import 'package:pgrkam/src/utils/toast_utils.dart';

import '../auth_page_model.dart';
import 'widgets.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool isProcessing = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                ),
                Text(
                  '''PUNJAB GHAR GHAR ROZGAR
    Department of Employment Generation,
    Skill Development & Training- Govt. Of Punjab, India
    ''',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 15,
                    // color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TitleDescription(
                  title: 'Sign In',
                  description: 'Sign in to apply for jobs',
                ),
                const SizedBox(height: 30),
                const EmailTextField(),
                const SizedBox(height: 15),
                const PasswordTextField(),
                const SizedBox(height: 25),
                Cta(
                  label: 'Sign In',
                  onPressed: () async {
                    if (!isProcessing) {
                      setState(() {
                        isProcessing = true;
                      });
                      final res = await ref
                          .read(authPageModelProvider.notifier)
                          .login();
                      if (res != '') {
                        showErrorMessage(context, res);
                      } else {
                        showSuccessMessage(context, 'Logged in successfully!');
                      }
                      if (mounted) {
                        setState(() {
                          isProcessing = false;
                        });
                      }
                    }
                  },
                  isProcessing: isProcessing,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New User ?'),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        ref
                            .read(authPageModelProvider.notifier)
                            .setAuthScreenStatus(AuthScreen.signUp);
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          color: Colors.orange,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
