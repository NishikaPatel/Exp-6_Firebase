import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/firestonedb.dart';
import 'package:flutter_application_1/realtime_db.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ensure initialisation
  FirebaseApp firebaseApp = await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAeqGRhOJND3AMOT2_QbIjSqEFtlU282B4",
      authDomain: "a3069-exp6.firebaseapp.com",
      projectId: "a3069-exp6",
      storageBucket: "a3069-exp6.appspot.com",
      messagingSenderId: "174369193219",
      appId: "1:174369193219:web:2a320887a4281525ca3d36",
      databaseURL: "https://a3069-exp6-default-rtdb.firebaseio.com/"
      ),
  );
  runApp(const MaterialApp(
    home: Scaffold(body: FirestoreDemo()),
  ));
}