import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../logic/repositories/auth_repository/auth_repository.dart';
import '../../../utils/time_utils.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Generate some dummy data for the cahrt
    // This will be used to draw the red line
    final users =
        ref.watch(authRepositoryProvider.select((value) => value.users));

    final updatedUsers = users?.toList()
      ?..removeWhere((element) => element.updatedAt == null);
    final activeUsers = (updatedUsers?.toList() ?? [])
      ..sort((a, b) => prettyTimestamp2(b.updatedAt ?? "")
          .compareTo(prettyTimestamp2(a.updatedAt ?? "")));
    final List<FlSpot> dummyData1 = List.generate(8, (index) {
      return FlSpot(
          index.toDouble(),
          activeUsers
              .where((element) =>
                  prettyTimestamp2(element.updatedAt ?? "").compareTo(
                      DateTime.now().subtract(Duration(days: 7 - index))) <
                  0)
              .length
              .toDouble());
    });

    // This will be used to draw the orange line
    final List<FlSpot> dummyData2 = List.generate(8, (index) {
      return FlSpot(
          index.toDouble(),
          activeUsers
              .where((element) =>
                  prettyTimestamp2(element.updatedAt ?? "").compareTo(
                      DateTime.now()
                          .add(Duration(days: 1))
                          .subtract(Duration(days: 7 - index))) <
                  0)
              .length
              .toDouble());
    });

    // This will be used to draw the blue line
    final List<FlSpot> dummyData3 = List.generate(8, (index) {
      return FlSpot(
          index.toDouble(),
          activeUsers
              .where((element) =>
                  prettyTimestamp2(element.updatedAt ?? "").compareTo(
                      DateTime.now().subtract(Duration(days: 7 - index))) <
                  0)
              .length
              .toDouble());
    });

    return Container(
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
              'User activity over time',
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
                SizedBox(
                  height: 170,
                  width: 250,
                  child: LineChart(
                    LineChartData(
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(),
                        topTitles: AxisTitles(),
                      ),
                      lineBarsData: [
                        // The red line
                        LineChartBarData(
                          spots: dummyData1,
                          isCurved: true,
                          barWidth: 3,
                          color: Colors.indigo,
                        ),
                        // The orange line
                        LineChartBarData(
                          spots: dummyData2,
                          isCurved: true,
                          barWidth: 3,
                          color: Colors.red,
                        ),
                        // The blue line
                        LineChartBarData(
                          spots: dummyData3,
                          isCurved: false,
                          barWidth: 3,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '30 Days',
                        style: GoogleFonts.outfit(
                          color: Colors.indigo,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(dummyData1.last.y.toStringAsFixed(0)),
                      Text(
                        '7 Days',
                        style: GoogleFonts.outfit(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(dummyData2.last.y.toStringAsFixed(0)),
                      Text(
                        '1 Day',
                        style: GoogleFonts.outfit(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(dummyData3.last.y.toStringAsFixed(0)),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
