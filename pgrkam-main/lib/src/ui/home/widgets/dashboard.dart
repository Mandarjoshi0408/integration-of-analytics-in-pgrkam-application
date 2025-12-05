import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import 'dashboard_page.dart';

class DashBoard extends ConsumerStatefulWidget {
  const DashBoard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashBoardState();
}

class _DashBoardState extends ConsumerState<DashBoard>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Future.delayed(Duration.zero, () {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: TabBar(
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                return states.contains(MaterialState.focused)
                    ? null
                    : Colors.transparent;
              },
            ),
            indicatorColor: primaryColor,
            isScrollable: false,
            labelColor: primaryColor,
            labelStyle: GoogleFonts.outfit(
              fontSize: 18,
            ),
            tabs: const [
              Tab(
                height: 40,
                child: Text('Dashboard'),
              ),
              Tab(
                height: 40,
                child: Text('Reports'),
              )
            ],
            controller: _tabController,
          ),
        ),
        Expanded(child: const DashboardPage()),
      ],
    );
  }
}
