// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

// // 🌎 Project imports:
// import '../../logic/repositories/auth_repository/auth_repository.dart';

/// Bottom navigation bar for tab pages
class PGKRAMBottomBar extends ConsumerWidget {
  final TabsRouter router;
  final int activeIndex;

  const PGKRAMBottomBar(
    this.router,
    this.activeIndex, {
    Key? key,
  }) : super(key: key);

  static final height = 60.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // const Divider(
          //   thickness: 1,
          //   color: Color(0xFFeeeeee),
          //   height: 0,
          // ),
          Container(
            height: PGKRAMBottomBar.height,
            decoration: const BoxDecoration(
              color: Colors.orange,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFdddddd),
                  offset: Offset(0, -1),
                  blurRadius: 0,
                ),
              ],
            ),
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 6,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _NavigationBarItem(
                  label: 'Home',
                  isActive: activeIndex == 0,
                  onTap: () async {
                    router.setActiveIndex(0);
                    _removeFocus(context);
                  },
                ),
                // if (isAuthenticated)
                _NavigationBarItem(
                  label: 'Jobs',
                  isActive: activeIndex == 1,
                  onTap: () async {
                    if (router.activeIndex == 1) {
                      _removeFocus(context);
                      return;
                    }
                    router.setActiveIndex(1);

                    _removeFocus(context);
                  },
                ),
                // _NavigationBarItem(
                //   label: 'Applied Jobs',
                //   isActive: activeIndex == 2,
                //   onTap: () async {
                //     router.setActiveIndex(2);
                //     _removeFocus(context);
                //   },
                // ),
                _NavigationBarItem(
                  label: 'Profile',
                  isActive: activeIndex == 3,
                  onTap: () {
                    router.setActiveIndex(3);
                    _removeFocus(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _removeFocus(BuildContext context) async => FocusScope.of(context).unfocus();
}

moveToTab(BuildContext context, WidgetRef ref, int index) {
  final router = context.tabsRouter;
  if (index >= 0 && index < 4) router.setActiveIndex(index);

  // remove focus
  FocusScope.of(context).unfocus();
}

class _NavigationBarItem extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavigationBarItem({
    required this.label,
    required this.isActive,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 4),
              Text(
                label,
                style: GoogleFonts.lato(
                  color: isActive ? const Color(0xFF000000) : Colors.white,
                  fontSize: isActive ? 18 : 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
