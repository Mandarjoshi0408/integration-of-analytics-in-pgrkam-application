import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/logic/services/api_services/api_service.dart';
import 'package:pgrkam/src/models/responses/api_response.dart';
import 'package:pgrkam/src/ui/home/demographic/demographic_page.dart';
import 'package:pgrkam/src/ui/home/user_engagement/user_engagement_page.dart';
import 'package:pgrkam/src/ui/home/widgets/line_chart_section.dart';
import 'package:pgrkam/src/utils/time_utils.dart';
import 'package:pgrkam/src/utils/toast_utils.dart';

import '../../../logic/repositories/auth_repository/auth_repository.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  Map<String, dynamic>? trackStats;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final res = await ref.read(apiServiceProvider).fetchTrackData();
      if (res.status != ApiStatus.success) {
        showErrorMessage(context, res.errorMessage ?? 'Somthing Went Wrong!');
      } else {
        if (mounted) {
          trackStats = res.data;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final applicantData = ref
    //     .watch(authRepositoryProvider.select((value) => value.applicantData));
    // print(applicantData);
    final users =
        ref.watch(authRepositoryProvider.select((value) => value.users));

    final updatedUsers = users?.toList()
      ?..removeWhere((element) => element.updatedAt == null);
    final activeUsers = (updatedUsers?.toList() ?? [])
      ..sort((a, b) => prettyTimestamp2(b.updatedAt ?? "")
          .compareTo(prettyTimestamp2(a.updatedAt ?? "")));
    final count = activeUsers
        .where((element) =>
            prettyTimestamp2(element.updatedAt ?? "")
                .compareTo(DateTime.now().subtract(Duration(minutes: 30))) >
            0)
        .length;
    return RefreshIndicator(
      onRefresh: () async {
        // ref.read(authRepositoryProvider.notifier).fetchUserDetails();
        await ref.read(authRepositoryProvider.notifier).fetchUserList();
        await ref.read(authRepositoryProvider.notifier).fetchUsersDetails();
        await ref.read(authRepositoryProvider.notifier).fetchJobsDetails();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(4, 4),
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            blurRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Total Registered Users',
                              textAlign: TextAlign.center,
                            ),
                            users == null
                                ? const Center(
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                        )),
                                  )
                                : FittedBox(
                                    child: Text(
                                      ref
                                              .watch(
                                                  authRepositoryProvider.select(
                                                      (value) => value.users))
                                              ?.length
                                              .toString() ??
                                          '0',
                                      style: GoogleFonts.outfit(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child: FittedBox(
                            //     child: Text(
                            //       '+10',
                            //       style: GoogleFonts.outfit(
                            //         fontSize: 14,
                            //         color: Colors.green,
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(4, 4),
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            blurRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Total Active users in 1 year',
                              textAlign: TextAlign.center,
                            ),
                            users == null
                                ? const Center(
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                        )),
                                  )
                                : FittedBox(
                                    child: Text(
                                      ref
                                              .watch(
                                                  authRepositoryProvider.select(
                                                      (value) => value.users))
                                              ?.where((element) =>
                                                  element.updatedAt != null)
                                              .length
                                              .toString() ??
                                          '0',
                                      style: GoogleFonts.outfit(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child: FittedBox(
                            //     child: Text(
                            //       '+10',
                            //       style: GoogleFonts.outfit(
                            //         fontSize: 14,
                            //         color: Colors.green,
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(4, 4),
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            blurRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Active Users\n(30 minutes)'),
                            users == null
                                ? const Center(
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                        )),
                                  )
                                : FittedBox(
                                    child: Text(
                                      count.toString(),
                                      style: GoogleFonts.outfit(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child: FittedBox(
                            //     child: Text(
                            //       '-50',
                            //       style: GoogleFonts.outfit(
                            //         fontSize: 14,
                            //         color: Colors.red,
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Traffic Analysis',
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  letterSpacing: -0.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(4, 4),
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            blurRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Instagram'),
                            trackStats == null
                                ? const Center(
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                        )),
                                  )
                                : FittedBox(
                                    child: Text(
                                      trackStats!['instagram'].toString(),
                                      style: GoogleFonts.outfit(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(4, 4),
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            blurRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Linkedin'),
                            trackStats == null
                                ? const Center(
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                        )),
                                  )
                                : FittedBox(
                                    child: Text(
                                      trackStats!['linkedin'].toString(),
                                      style: GoogleFonts.outfit(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(4, 4),
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            blurRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Facebook'),
                            trackStats == null
                                ? const Center(
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                        )),
                                  )
                                : FittedBox(
                                    child: Text(
                                      trackStats!['facebook'].toString(),
                                      style: GoogleFonts.outfit(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DemographicInformationPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(4, 4),
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        blurRadius: 5,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'User Demographic\nInformation',
                              style: GoogleFonts.outfit(
                                fontSize: 18,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          'assets/images/bar.png',
                          height: 120,
                          fit: BoxFit.cover,
                          width: MediaQuery.sizeOf(context).width,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              users == null
                  ? const Center(
                      child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                          )),
                    )
                  : MyHomePage(),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserEngagementPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(4, 4),
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        blurRadius: 5,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Engagement',
                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          'assets/images/pie.png',
                          height: 120,
                          fit: BoxFit.contain,
                          width: MediaQuery.sizeOf(context).width,
                        ),
                        // Row(
                        //   children: [
                        //     SizedBox(
                        //       width: 200,
                        //       height: 150,
                        //       child: PieChart(
                        //         PieChartData(
                        //           sections: [
                        //             PieChartSectionData(
                        //               value: 30,
                        //               title: 'Patiala',
                        //               color: Colors.amber,
                        //             ),
                        //             PieChartSectionData(
                        //               value: 100,
                        //               title: 'Rajpura',
                        //               color: Colors.lime,
                        //             ),
                        //             PieChartSectionData(
                        //               value: 60,
                        //               title: 'Ambala',
                        //               color: Colors.pinkAccent,
                        //             ),
                        //           ],
                        //           centerSpaceRadius: 30,
                        //           // read about it in the PieChartData section
                        //         ),
                        //         swapAnimationDuration:
                        //             const Duration(milliseconds: 150), // Optional
                        //         swapAnimationCurve: Curves.linear, // Optional
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
