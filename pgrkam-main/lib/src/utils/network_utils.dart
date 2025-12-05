import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

/// returns true, if internet is connected
/// returns false, if internet is not connected
/// returns null, if internet connectivity cannot be determined
Future<bool?> hasInternetAccess() async {
  // Web platform doesn't support dart:io InternetAddress
  if (kIsWeb) {
    return null;
  }

  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return null;
}
