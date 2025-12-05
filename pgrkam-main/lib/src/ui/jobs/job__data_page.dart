import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/constants/colors.dart';
import 'package:pgrkam/src/logic/repositories/auth_repository/auth_repository.dart';
import 'package:pgrkam/src/logic/services/preference_services.dart';
import 'package:pgrkam/src/models/responses/user_data.dart';
import 'package:pgrkam/src/ui/home/widgets/user_home_page.dart';

import '../../models/responses/job_data.dart';

class JobDataPage extends ConsumerStatefulWidget {
  final JobData jobData;
  const JobDataPage({
    super.key,
    required this.jobData,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobDataPageState();
}

class _JobDataPageState extends ConsumerState<JobDataPage> {
  bool isApplied = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final res = ref.read(sharedPreferencesProvider).getStringList('jobs');
      if (mounted) {
        setState(() {
          isApplied = res?.contains(widget.jobData.jobId) ?? false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userData =
        ref.watch(authRepositoryProvider.select((value) => value.authUser));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.jobData.job_title,
          style: GoogleFonts.outfit(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Number of Vacancies : ',
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.jobData.no_of_vacancies.toString(),
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
                    'Max Age : ',
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.jobData.max_age.toString(),
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
                    'Description : ',
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.jobData.job_description,
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
        ),
      ),
      bottomNavigationBar: userData != null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  final res =
                      ref.read(sharedPreferencesProvider).getStringList('jobs');
                  ref.read(sharedPreferencesProvider).setStringList(
                      'jobs', (res?.toList() ?? [])..add(widget.jobData.jobId));
                  setState(() {
                    isApplied = true;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isApplied ? Colors.green : Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      isApplied ? "Applied" : 'Apply',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  height: 50,
                ),
              ),
            )
          : null,
    );
  }
}
