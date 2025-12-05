import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AppliedJobsPage extends ConsumerStatefulWidget {
  const AppliedJobsPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AppliedJobsPageState();
}

class _AppliedJobsPageState extends ConsumerState<AppliedJobsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Text('Applied Jobs'),
          ],
        ),
      ),
    );
  }
}
