import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/ui/home/demographic/dropdown_filter.dart';
import 'package:pgrkam/src/ui/home/widgets/user_home_page.dart';

import '../../logic/repositories/auth_repository/auth_repository.dart';

@RoutePage()
class JobsListPage extends ConsumerStatefulWidget {
  const JobsListPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _JobsListPageState();
}

class _JobsListPageState extends ConsumerState<JobsListPage> {
  int selectedJobType = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final jobsList =
        ref.watch(authRepositoryProvider.select((value) => value.jobData));
    final updatedList = jobsList?.toList().where((element) =>
        selectedJobType == 1
            ? element.type == 'govt'
            : element.type == 'private');
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: jobsList == null || updatedList == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.white,
                    title: Text(
                      " Jobs",
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Filters",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        CustomDropDownButton(
                          selectedId: selectedJobType,
                          onChanged: (value) {
                            setState(() {
                              selectedJobType = value;
                            });
                          },
                          data: [
                            {0: "All"},
                            {1: 'Govt. Job'},
                            {2: " Pvt. Job"},
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children:
                            (selectedJobType == 0 ? jobsList : updatedList)
                                .toList()
                                .getRange(0, 50)
                                .map((e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      child: JobCard(jobData: e),
                                    ))
                                .toList(),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
