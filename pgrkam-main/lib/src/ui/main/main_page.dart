import 'package:auto_route/auto_route.dart';

import '/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/repositories/auth_repository/auth_repository.dart';

import 'bottom_bar.dart';

@RoutePage()
class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(authRepositoryProvider, (previous, next) {
      if (next.status == AuthStatus.noInternet) {
        context.replaceRoute(const NoInternetRoute());
      }
      if (next.status == AuthStatus.initial) {
        context.replaceRoute(const MainRoute());
      }
    });
    final userData =
        ref.watch(authRepositoryProvider.select((value) => value.authUser));

    final status =
        ref.watch(authRepositoryProvider.select((value) => value.status));

    return AutoTabsScaffold(
      // animationDuration: const Duration(milliseconds: 700),
      // // animationCurve: Curves.easeInCubic,
      // transitionBuilder: (context, child, animation) => SlideTransition(
      //   position: Tween<Offset>(
      //     begin: context.tabsRouter.previousIndex == null
      //         ? Offset.zero
      //         : context.tabsRouter.previousIndex! >=
      //                 context.tabsRouter.activeIndex
      //             ? const Offset(-0.6, 0.0)
      //             : const Offset(0.6, 0.0),
      //     end: Offset.zero,
      //   ).animate(animation),
      // child: FadeTransition(
      //   //   opacity: animation,
      //     child: child,
      //   // ),
      // ),
      routes: const [
        HomeRoute(),
        JobsListRoute(),
        AppliedJobsRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: status == AuthStatus.initial && userData == null
          ? null
          : userData == null || userData.role == 'applicant'
              ? (context, router) => PGKRAMBottomBar(router, router.activeIndex)
              : null,
    );
  }
}
