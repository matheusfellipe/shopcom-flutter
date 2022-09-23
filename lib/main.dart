import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/screen/login/login_screen_new.dart';

void main() async {
  const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyBtCpy2pLzjBm_97J90xxsEqNt8U0RqLhk",
    authDomain: "shopcom-b9722.firebaseapp.com",
    projectId: "shopcom-b9722",
    storageBucket: "shopcom-b9722.appspot.com",
    messagingSenderId: "164659204961",
    appId: "1:164659204961:web:cdb9d319e03e450161ab20",
  );
  if (kIsWeb) {
    await Firebase.initializeApp(options: firebaseConfig);
    // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    // FirebaseFirestore.instance.useFirestoreEmulator("localhost", 8080);
  } else {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    // FirebaseFirestore.instance.useFirestoreEmulator("localhost", 8080);
  }
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Compras 1.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreenNew(),
    );
  }
}
