import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/logic/repositories/auth_repository/auth_repository.dart';

import 'package:pgrkam/src/routing/router.dart';
import 'package:pgrkam/src/ui/auth/widgets/widgets.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final status =
        ref.watch(authRepositoryProvider.select((value) => value.status));
    final userData =
        ref.watch(authRepositoryProvider.select((value) => value.authUser));
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (userData != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (userData.userName.trim()),
                        maxLines: 2,
                        style: GoogleFonts.lato(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        userData.email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Cta(
                      label: status == AuthStatus.authenticated
                          ? 'Log Out'
                          : 'Login',
                      onPressed: () {
                        if (userData != null) {
                          ref.read(authRepositoryProvider.notifier).signOut();
                          context.popRoute();
                        } else {
                          context.navigateTo(AuthRoute());
                        }
                      },
                      isProcessing: false),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //
                //   },
                //   child: Text(
                //       status == AuthStatus.authenticated ? 'LogOut' : 'Login'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
