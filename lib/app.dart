import 'package:flutter/material.dart';
import './services/AuthService/authservice.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  _AppState();

  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => authService.getAuthState(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
