import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  // ignore: non_constant_identifier_names
  static FirebaseOptions get PlatformOptions {
    if (Platform.isIOS) {
      return const FirebaseOptions(
          appId: "1:442062515947:ios:620d92168424ba922318ae",
          apiKey: "AIzaSyDWpCRmDGJKDnsYJ08gwsqrEd_qvxmK5gs",
          messagingSenderId: "442062515947",
          projectId: "ecommers-2a7bb",
          iosBundleId: "com.example.ecommers");
    } else {
      return const FirebaseOptions(
        appId: "1:442062515947:android:86639272c48125f42318ae",
        apiKey: "AIzaSyAuIhhhRDNP_8z8Fw__3FFj5wS1dsEdGmg",
        messagingSenderId: "442062515947",
        projectId: "ecommers-2a7bb",
      );
    }
  }
}
