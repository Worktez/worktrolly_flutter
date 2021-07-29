import 'package:flutter/material.dart';
import 'package:worktrolly_flutter/head-component/HeadComponent.dart';
import 'body-component/BodyComponent.dart';

Image appLogo = new Image(
  image: new ExactAssetImage("assets/images/logo.png"),
  width: 45,
  height: 45,
  fit: BoxFit.contain,
  alignment: FractionalOffset.center,
);

Color primaryMainColor = const Color(0xFF5A20F0);
Color secondaryMainColor = const Color(0xFF16C85A);
Color primaryBackgroundColor = const Color(0xFFFFFFFF);

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
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
        home: Scaffold(
          appBar: AppBar(
            leading: appLogo,
            actions: [
              Container(
                child: HeadComponent(),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 800,
                  child: BodyComponent(),
                )
              ],
            ),
          ),
        ));
  }
}
