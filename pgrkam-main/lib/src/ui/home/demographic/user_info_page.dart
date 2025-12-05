import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/logic/repositories/auth_repository/auth_repository.dart';
import 'package:pgrkam/src/models/responses/job_data.dart';

import '../../../models/responses/user_data.dart';

class UserInfoPage extends ConsumerStatefulWidget {
  final List<ApplicantData> data;
  const UserInfoPage({
    super.key,
    required this.data,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends ConsumerState<UserInfoPage> {
  List<UserData?> userData = [];
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      userData = [];
      final users =
          ref.read(authRepositoryProvider.select((value) => value.users));
      if (users != null && widget.data.isNotEmpty) {
        for (var datas in widget.data) {
          try {
            userData.add(users.firstWhere(
                (element) => element.userId.trim() == datas.userId.trim()));
          } catch (e) {
            print(e.toString());
          }
        }
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Name',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Mobile Number',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: userData
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e?.userName ?? '',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              e?.phone.toString() ?? '',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    ));
  }
}
