import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/models/responses/job_data.dart';
import 'package:pgrkam/src/ui/home/demographic/dropdown_filter.dart';
import 'package:pgrkam/src/ui/home/demographic/user_info_page.dart';

import '../../../logic/repositories/auth_repository/auth_repository.dart';

class DemographicInformationPage extends ConsumerStatefulWidget {
  const DemographicInformationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DemographicInformationPageState();
}

class _DemographicInformationPageState
    extends ConsumerState<DemographicInformationPage> {
  int selectedFirstFilter = 1;
  int? selectedSecondFilter;
  int selectedInterest = 1;
  int pages = 1;
  int selectedPage = 1;
  String? selectedInterests;
  String? selectedGender;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final applicantData = ref
          .watch(authRepositoryProvider.select((value) => value.applicantData));
      final datas = applicantData == null
          ? null
          : groupBy(applicantData.reversed,
              (ApplicantData obj) => obj.location?.toLowerCase());
      pages = ((datas?.length ?? 0) / 10).ceil().toInt();
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final count = List<int>.generate(10, (i) => i + (selectedPage - 1) * 10);

    final applicantData = ref
        .watch(authRepositoryProvider.select((value) => value.applicantData));
    final datas = applicantData == null
        ? null
        : groupBy(applicantData.reversed,
            (ApplicantData obj) => obj.location?.toLowerCase());
    pages = ((datas?.length ?? 0) / 10).ceil().toInt();
    final interests = applicantData == null
        ? null
        : groupBy(
            applicantData.reversed.toList()
              ..removeWhere((element) => element.skills.isEmpty),
            (ApplicantData obj) => obj.skills.first);
    final name = (datas?.keys.toList() ?? [])
      ..sort((a, b) => (a ?? '').compareTo(b ?? ''));
    final highestEducation = {
      1: "All",
      2: "High School",
      3: "Bachelor's Degree",
      4: "Master's Degree",
      5: "PhD",
    };

    // final data =
    //     List<int>.generate(name?.length ?? 0, (index) => Random().nextInt(2500))
    //       ..sort((a, b) => b.compareTo(a));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: const Text('User Demographic Information'),
            ),
            if (datas != null &&
                name.isNotEmpty &&
                applicantData != null &&
                interests != null) ...[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Select Filter'),
                    CustomDropDownButton<int>(
                      selectedId: selectedFirstFilter,
                      onChanged: (value) {
                        setState(() {
                          selectedFirstFilter = value;
                        });
                      },
                      data: const [
                        {1: "Highest Education"},
                        {2: "Gender"},
                        {3: "Interest"},
                      ],
                    ),
                  ],
                ),
              ),
              if (selectedFirstFilter == 3) ...[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Select Interest : '),
                      CustomDropDownButton<String>(
                        selectedId: selectedInterests,
                        onChanged: (value) {
                          setState(() {
                            selectedInterests = value;
                          });
                        },
                        data: [
                          const {'All': 'All'},
                          ...interests.entries.map((e) => {e.key: e.key})
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              if (selectedFirstFilter == 2) ...[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Select Gender : '),
                      CustomDropDownButton<String>(
                        selectedId: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                        data: const [
                          {'All': 'All'},
                          {'Male': 'Male'},
                          {"Female": "Female"},
                          {"Other": "Other"},
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              if (selectedFirstFilter == 1) ...[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Select Education: '),
                      CustomDropDownButton<int>(
                        selectedId: selectedInterest,
                        onChanged: (value) {
                          setState(() {
                            selectedInterest = value;
                          });
                        },
                        data: highestEducation.entries
                            .map((entry) => {entry.key: entry.value})
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  // color: Colors.black,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffd8e3ff),
                  ),
                  width: MediaQuery.sizeOf(context).width,
                  height: 340,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 70),
                    child: BarChart(
                      BarChartData(
                        borderData: FlBorderData(
                          show: false,
                        ),

                        titlesData: FlTitlesData(
                          rightTitles: AxisTitles(),
                          topTitles: AxisTitles(),
                          bottomTitles:
                              AxisTitles(sideTitles: _bottomTitles(name)),
                        ),
                        backgroundColor: const Color(0xffd8e3ff),
                        gridData: FlGridData(
                          drawHorizontalLine: false,
                          show: false,
                        ),
                        barGroups: [
                          ...count.map(
                            (e) => BarChartGroupData(
                              x: e + 1,
                              groupVertically: true,
                              barRods: [
                                BarChartRodData(
                                  toY: selectedFirstFilter == 1 &&
                                          selectedInterest != 1
                                      ? (((datas[name[e]] ?? []).where((e2) =>
                                              e2.highestEducation ==
                                              highestEducation[selectedInterest]))
                                          .toList()
                                          .length
                                          .toDouble())
                                      : selectedFirstFilter == 3 &&
                                              selectedInterests != 'All' &&
                                              selectedInterests != null
                                          ? (((datas[name[e]] ?? [])
                                                  .where((e2) => e2.skills.contains(selectedInterests)))
                                              .toList()
                                              .length
                                              .toDouble())
                                          : selectedFirstFilter == 2 &&
                                                  selectedGender != 'All' &&
                                                  selectedGender != null
                                              ? (((datas[name[e]] ?? [])
                                                      .where((e2) => e2.gender.toLowerCase() == selectedGender?.toLowerCase()))
                                                  .toList()
                                                  .length
                                                  .toDouble())
                                              : (datas[name[e]] ?? [])
                                                  .toList()
                                                  .length
                                                  .toDouble(),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  width: 15,
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ],
                              // color: Colors.red,
                            ),
                          ),
                        ],
                        // centerSpaceRadius: 15,
                        // read about it in the PieChartData section
                      ),
                      swapAnimationDuration:
                          const Duration(milliseconds: 150), // Optional
                      swapAnimationCurve: Curves.linear, // Optional
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<int>.generate(pages, (index) => index + 1)
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPage = e;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: selectedPage == e
                                    ? Colors.green
                                    : Colors.grey.shade200,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  e.toString(),
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'City',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Users",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: name.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            width: 0.5,
                            color: Color(0xff9ebc94),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserInfoPage(
                                          data: (selectedFirstFilter == 1 &&
                                                  selectedInterest != 1
                                              ? ((datas[name[index]] ?? [])
                                                  .where((e2) =>
                                                      e2.highestEducation ==
                                                      highestEducation[
                                                          selectedInterest])
                                                  .toList())
                                              : selectedFirstFilter == 3 &&
                                                      selectedInterests != 'All'
                                                  ? (((datas[name[index]] ?? [])
                                                          .where((e2) => e2.skills.contains(selectedInterests)))
                                                      .toList())
                                                  : selectedFirstFilter == 2 &&
                                                          selectedGender !=
                                                              'All'
                                                      ? (((datas[name[index]] ?? []).where((e2) =>
                                                              e2.gender.toLowerCase() ==
                                                              selectedGender
                                                                  ?.toLowerCase()))
                                                          .toList())
                                                      : (datas[name[index]] ?? [])
                                                          .toList()),
                                        )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                name[index] ?? '',
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    (selectedFirstFilter == 1 &&
                                            selectedInterest != 1
                                        ? ((datas[name[index]] ?? [])
                                            .where((e2) =>
                                                e2.highestEducation ==
                                                highestEducation[
                                                    selectedInterest])
                                            .toList()
                                            .length
                                            .toString())
                                        : selectedFirstFilter == 3 &&
                                                selectedInterests != 'All'
                                            ? (((datas[name[index]] ?? [])
                                                    .where((e2) => e2.skills
                                                        .contains(selectedInterests)))
                                                .toList()
                                                .length
                                                .toString())
                                            : selectedFirstFilter == 2 &&
                                                    selectedGender != 'All'
                                                ? (((datas[name[index]] ?? [])
                                                        .where((e2) =>
                                                            e2.gender.toLowerCase() ==
                                                            selectedGender
                                                                ?.toLowerCase()))
                                                    .toList()
                                                    .length
                                                    .toString())
                                                : (datas[name[index]] ?? [])
                                                    .toList()
                                                    .length
                                                    .toString()),
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ] else
              CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  SideTitles _bottomTitles(List<String?> name) => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          return Transform.rotate(
              angle: 36.1,
              child: Text('${name[value.toInt() - 1]}                   '));
        },
      );
}
