import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB1kACScCGrcoQ8nhE3s_kLpU5O9NEp9WE",
            authDomain: "todo-50b2e.firebaseapp.com",
            projectId: "todo-50b2e",
            storageBucket: "todo-50b2e.firebasestorage.app",
            messagingSenderId: "342128712092",
            appId: "1:342128712092:web:3e7fd0e7f3922726161059",
            measurementId: "G-9XHWH9JF9Y"));
  } else {
    await Firebase.initializeApp();
  }
}
