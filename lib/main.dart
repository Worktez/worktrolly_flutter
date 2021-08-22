import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:worktrolly_flutter/common-tools/loading-component/LoadingComponent.dart';
import 'package:worktrolly_flutter/error-component/ErrorComponent.dart';
import 'package:worktrolly_flutter/services/ApplicationService/applicationService.dart';
import 'app.dart';
import 'pages/home-component/HomeComponent.dart';
import 'pages/login-component/LoginComponent.dart';
import 'services/ThemeService/ThemeService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await _connectToFirebaseEmulator();

  runApp(MyApp());
}

Future _connectToFirebaseEmulator() async {
  setDevice();
  await setEmulator();
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return ErrorComponent();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Worktrolly',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primaryColor: primaryBackgroundColor,
              // primarySwatch: Colors.grey,
            ),
            home: App(),
            routes: {
              '/login': (ctx) => LoginComponent(),
              '/home': (ctx) => HomeComponent(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return LoadingComponent();
      },
    );
  }
}
