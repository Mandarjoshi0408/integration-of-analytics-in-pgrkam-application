import 'package:auto_route/auto_route.dart';
import 'package:pgrkam/src/ui/auth/widgets/sign_up_screen.dart';
import '/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/repositories/auth_repository/auth_repository.dart';
import '../../utils/toast_utils.dart';
import 'auth_page_model.dart';
import 'widgets/widgets.dart';

@RoutePage()
class AuthPage extends ConsumerWidget {
  final bool isOpenedFromContestPage;

  const AuthPage({
    this.isOpenedFromContestPage = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // listen to authRepository
    // pop all routes and show games tab, if status is authenticated
    ref.listen(authRepositoryProvider, (previous, next) {
      if (next.status == AuthStatus.authenticated) {
        showSuccessMessage(
          context,
          'Login successful',
        );
        AutoRouter.of(context).popUntilRoot();
        ref.read(authRepositoryProvider.notifier).fetchUserDetails();
        context.popRoute();
        context.replaceRoute(const MainRoute());
      }
      // handle signout when error occurs in making API call on successful authentication with Firebase
      else if (next.status == AuthStatus.unauthenticated) {
        showErrorMessage(
          context,
          'Something went wrong! Please Try Again',
        );
      }
    });

    ref.listen(authPageModelProvider, (previous, next) {
      if (next.status == AuthPageStatus.error) {
        showErrorMessage(
          context,
          next.errorMessage ?? 'Something went wrong!',
        );
      }
    });
    final screen =
        ref.watch(authPageModelProvider.select((value) => value.activeScreen));

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            screen == AuthScreen.signIn
                ? const Expanded(child: LoginScreen())
                : const Expanded(child: SignUpScreen()),
          ],
        ),
      ),
    );
  }
}
