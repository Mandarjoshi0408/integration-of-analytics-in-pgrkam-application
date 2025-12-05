import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pgrkam/src/logic/repositories/auth_repository/auth_repository.dart';
import 'package:pgrkam/src/ui/home/widgets/ad_corousal.dart';
import 'package:pgrkam/src/ui/home/widgets/course_card.dart';
import 'package:pgrkam/src/ui/jobs/job__data_page.dart';

import '../../../models/responses/job_data.dart';

class UserHomePage extends ConsumerStatefulWidget {
  const UserHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserHomePageState();
}

class _UserHomePageState extends ConsumerState<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    final jobsList =
        ref.watch(authRepositoryProvider.select((value) => value.jobData));
    final recommendedJobsList = ref.watch(
        authRepositoryProvider.select((value) => value.recommmendedJobs));
    final userData =
        ref.watch(authRepositoryProvider.select((value) => value.authUser));

    return (jobsList == null)
        ? const SizedBox(
            height: 600, child: Center(child: CircularProgressIndicator()))
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 250, child: HomeCorousalSection()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Recommended Jobs',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                if (userData != null) ...[
                  const SizedBox(
                    height: 5,
                  ),
                  if (recommendedJobsList != null)
                    SizedBox(
                      height: 205,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: recommendedJobsList
                              .map((e) => Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: JobCard(
                                      jobData: e.keys.first,
                                      successScore: e.values.first,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    )
                  else
                    const SizedBox(
                      height: 170,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ] else
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'Please Login to get job recommendation and many more features',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Courses',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 190,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List<int>.generate(5, (value) => value)
                          .map(
                            (e) => Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: EventCard(),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
  }
}

class JobCard extends ConsumerStatefulWidget {
  final JobData jobData;
  final String? successScore;
  const JobCard({
    super.key,
    required this.jobData,
    this.successScore,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobCardState();
}

class _JobCardState extends ConsumerState<JobCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => JobDataPage(jobData: widget.jobData)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.green.withOpacity(0.7),
        ),
        // height: 200,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Job Title: ',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.jobData.job_title,
                          maxLines: 2,
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Job Type: ',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.jobData.type,
                          maxLines: 1,
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Job Salary: ',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.jobData.salary,
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Location : ',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.jobData.location,
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Industry : ',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.jobData.industry
                              .fold(
                                  '',
                                  (previousValue, element) =>
                                      previousValue + '-' + element)
                              .substring(1),
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Experience : ',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.jobData.experience,
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (widget.successScore != null)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orange,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Text(
                            'Score : ',
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            (double.parse(widget.successScore ?? '0')
                                .toStringAsFixed(3)),
                            style: GoogleFonts.outfit(
                                // fontWeight: FontWeight.w700,
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
