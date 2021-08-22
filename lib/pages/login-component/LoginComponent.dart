import 'package:flutter/material.dart';
import 'package:worktrolly_flutter/pages/login-component/LoginComponentBody.dart';
import 'package:worktrolly_flutter/pages/login-component/LoginComponentHead.dart';
import 'package:worktrolly_flutter/pages/page-layout/PageLayout.dart';
import 'package:worktrolly_flutter/services/NavigatorService/NavigatorService.dart';

class LoginComponent extends StatelessWidget {
  LoginComponent() {
    navigatorService.headWidget = LoginComponentHead();
    navigatorService.bodyWidget = LoginComponentBody();
    navigatorService.currentPage = "Login";
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout();
  }
}
