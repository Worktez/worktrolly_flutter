import 'package:flutter/material.dart';

class NavigatorService {
  Widget headWidget = Text("Head");
  Widget bodyWidget = Text("Body");

  String currentPage = "Login";

  bool loggedIn = false;

  loadApplication(BuildContext ctx) {
    print("Loading Application...");
    loggedIn = true;
    print(currentPage);
    if (currentPage == "Login") {
      navigateToHome(ctx);
    }
  }

  stopApplication(BuildContext ctx) {
    print("Stoping Application...");
    loggedIn = false;
    navigateToLogin(ctx);
  }

  void navigateToHome(BuildContext ctx) {
    print("Navigating to home...");
    Navigator.pushNamed(
      ctx,
      '/home',
    );
  }

  void navigateToLogin(BuildContext ctx) {
    print("Navigating to login...");
    Navigator.pushNamed(
      ctx,
      '/login',
    );
  }
}

NavigatorService navigatorService = new NavigatorService();
