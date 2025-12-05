import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

import 'src/logic/services/preference_services.dart';
import 'src/ui/admin/admin_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AdminDashboardPage(),
      ),
    ),
  );
}
