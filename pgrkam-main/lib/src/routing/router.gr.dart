// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AdminDashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdminDashboardPage(),
      );
    },
    AdminProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdminProfilePage(),
      );
    },
    AppliedJobsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppliedJobsPage(),
      );
    },
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthPage(
          isOpenedFromContestPage: args.isOpenedFromContestPage,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    JobsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JobsListPage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    NoInternetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NoInternetPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [AdminDashboardPage]
class AdminDashboardRoute extends PageRouteInfo<void> {
  const AdminDashboardRoute({List<PageRouteInfo>? children})
      : super(
          AdminDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminDashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AdminProfilePage]
class AdminProfileRoute extends PageRouteInfo<void> {
  const AdminProfileRoute({List<PageRouteInfo>? children})
      : super(
          AdminProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppliedJobsPage]
class AppliedJobsRoute extends PageRouteInfo<void> {
  const AppliedJobsRoute({List<PageRouteInfo>? children})
      : super(
          AppliedJobsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppliedJobsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    bool isOpenedFromContestPage = false,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            isOpenedFromContestPage: isOpenedFromContestPage,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<AuthRouteArgs> page = PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.isOpenedFromContestPage = false,
    this.key,
  });

  final bool isOpenedFromContestPage;

  final Key? key;

  @override
  String toString() {
    return 'AuthRouteArgs{isOpenedFromContestPage: $isOpenedFromContestPage, key: $key}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JobsListPage]
class JobsListRoute extends PageRouteInfo<void> {
  const JobsListRoute({List<PageRouteInfo>? children})
      : super(
          JobsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'JobsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoInternetPage]
class NoInternetRoute extends PageRouteInfo<void> {
  const NoInternetRoute({List<PageRouteInfo>? children})
      : super(
          NoInternetRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoInternetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
