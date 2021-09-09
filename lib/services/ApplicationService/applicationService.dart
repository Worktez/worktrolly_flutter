import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:worktrolly_flutter/environment/environment.dart';

late Device device;

setDevice() {
  bool isIos = UniversalPlatform.isIOS;
  bool isWeb = UniversalPlatform.isWeb;
  bool isAndroid = UniversalPlatform.isAndroid;

  if (isIos) {
    device = Device.iOS;
  } else if (isWeb) {
    device = Device.web;
  } else if (isAndroid) {
    device = Device.android;
  }
}

Device getDevice() {
  return device;
}

String getEmulatorLink() {
  final localHostString = isAndroid() ? '10.0.2.2' : 'localhost';
  return localHostString;
}

bool isAndroid() {
  if (device == Device.android) {
    return true;
  }
  return false;
}

bool isWeb() {
  if (device == Device.web) {
    return true;
  }
  return false;
}

bool isIOS() {
  if (device == Device.iOS) {
    return true;
  }
  return false;
}

Future setEmulator() async {
  // FirebaseFirestore.instance.settings = Settings(
  //   host: '$localHostString:8080',
  //   sslEnabled: false,
  //   persistanceEnabled: false,
  // );
  print("Setting Emulator");
  if (USE_EMULATOR) {
    final localHostString = getEmulatorLink();
    await FirebaseAuth.instance.useAuthEmulator(localHostString, 9099);
    // Ideal time to initialize
    FirebaseFunctions.instance.useFunctionsEmulator(localHostString, 7001);
  }
}
