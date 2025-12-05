import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/ui/home/demographic/dropdown_filter.dart';
import 'package:collection/collection.dart';
import 'package:pgrkam/src/utils/toast_utils.dart';

import '../../../logic/repositories/auth_repository/auth_repository.dart';
import '../../../models/responses/job_data.dart';
import '../auth_page_model.dart';
import 'widgets.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<SignUpScreen> {
  bool isProcessing = false;
  int selectedGender = 1;
  int selectedEducation = 1;
  String? selectedDistrict;
  List<String> skills = [];
  @override
  Widget build(BuildContext context) {
    final userType = ref.watch(authPageModelProvider.select((_) => _.userType));
    final applicantData = ref
        .watch(authRepositoryProvider.select((value) => value.applicantData));

    final interest = applicantData == null
        ? null
        : groupBy(
                applicantData.reversed.toList()
                  ..removeWhere((element) => element.skills.isEmpty),
                (ApplicantData obj) => obj.skills.first)
            .entries
            .sorted((a, b) => b.value.length.compareTo(a.value.length));

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                ),
                Text(
                  '''PUNJAB GHAR GHAR ROZGAR
    Department of Employment Generation,
    Skill Development & Training- Govt. Of Punjab, India
    ''',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 15,
                    // color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TitleDescription(
                  title: 'Sign Up',
                  description: 'Sign Up to apply for jobs',
                ),
                const SizedBox(height: 30),
                const NameTextField(),
                const SizedBox(height: 15),
                const EmailTextField(),
                const SizedBox(height: 15),
                const PasswordTextField(),
                const SizedBox(height: 15),
                const MobileTextField(),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select User Type'),
                    CustomDropDownButton(
                        selectedId: UserType.applicant == userType ? 1 : 2,
                        onChanged: (value) {
                          ref.read(authPageModelProvider.notifier).setRole(
                              value == 1
                                  ? UserType.applicant
                                  : UserType.employer);
                        },
                        data: const [
                          {1: "Applicant"},
                          {2: "Employeer"}
                        ]),
                  ],
                ),
                const SizedBox(height: 15),
                if (userType == UserType.applicant) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Select Gender'),
                      CustomDropDownButton(
                          selectedId: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                          data: const [
                            {1: "Male"},
                            {2: "Female"},
                            {3: "Others"}
                          ]),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Select Highest Education'),
                      CustomDropDownButton(
                          selectedId: selectedEducation,
                          onChanged: (value) {
                            setState(() {
                              selectedEducation = value;
                            });
                          },
                          data: const [
                            {1: "Other"},
                            {2: "High School"},
                            {3: "Bachelor's Degree"},
                            {4: "Master's Degree"},
                            {5: "PhD"},
                          ]),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Select District'),
                      CustomDropDownButton<String>(
                        selectedId: selectedDistrict,
                        onChanged: (value) {
                          setState(() {
                            selectedDistrict = value;
                          });
                        },
                        data: [
                          {"Patiala": "Patiala"},
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  if (interest != null) ...[
                    Row(
                      children: [
                        Text('Select Skills'),
                      ],
                    ),
                    SizedBox(
                      // height: 200,
                      width: 300,
                      child: Wrap(
                        children: interest
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (skills.contains(e.key)) {
                                        skills.remove(e.key);
                                      } else {
                                        skills.add(e.key);
                                      }
                                      if (mounted) {
                                        setState(() {});
                                      }
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: skills.contains(e.key)
                                              ? Colors.green.withOpacity(0.5)
                                              : Colors.orange,
                                          border: skills.contains(e.key)
                                              ? Border.all(
                                                  color: Colors.green, width: 2)
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(e.key.toString()),
                                        )),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ],
                const SizedBox(
                  height: 30,
                ),
                Cta(
                  label: 'Sign Up',
                  onPressed: () async {
                    if (!isProcessing) {
                      setState(() {
                        isProcessing = true;
                      });
                      final res = await ref
                          .read(authPageModelProvider.notifier)
                          .signIn(
                              selectedGender == 1
                                  ? 'Male'
                                  : selectedGender == 2
                                      ? 'Female'
                                      : 'Others',
                              [
                                {1: "Other"},
                                {2: "High School"},
                                {3: "Bachelor's Degree"},
                                {4: "Master's Degree"},
                                {5: "PhD"},
                              ]
                                  .firstWhere(
                                      (e) => e.keys.first == selectedEducation)
                                  .values
                                  .first,
                              selectedDistrict,
                              skills);
                      if (res != '') {
                        showErrorMessage(context, res);
                      } else {
                        showSuccessMessage(context, 'Account Created');
                        ref
                            .read(authPageModelProvider.notifier)
                            .setAuthScreenStatus(AuthScreen.signIn);
                      }
                      if (mounted) {
                        setState(() {
                          isProcessing = false;
                        });
                      }
                    }
                  },
                  isProcessing: isProcessing,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have an  Account ?'),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        ref
                            .read(authPageModelProvider.notifier)
                            .setAuthScreenStatus(AuthScreen.signIn);
                      },
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          color: Colors.orange,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
