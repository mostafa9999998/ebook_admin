import 'package:ebook_admin/view/Ui/admin%20panel/admin%20panel%20screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBOGCTXZaxTlUw5iykxg2Djyi-ZsES3mpY",
          authDomain: "ebook-82d79.firebaseapp.com",
          projectId: "ebook-82d79",
          storageBucket: "ebook-82d79.appspot.com",
          messagingSenderId: "511766617852",
          appId: "1:511766617852:web:b7d12452146fcfe92f4179",
          measurementId: "G-0D02YMCT0T"

      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:AdminPanelScreen() ,
    );
  }
}
