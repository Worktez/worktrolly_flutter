import 'package:flutter/material.dart';
import 'package:worktrolly_flutter/pages/home-component/HomeComponentBody.dart';
import 'package:worktrolly_flutter/pages/home-component/HomeComponentHead.dart';
import 'package:worktrolly_flutter/pages/page-layout/PageLayout.dart';
import 'package:worktrolly_flutter/services/NavigatorService/NavigatorService.dart';

class HomeComponent extends StatelessWidget {
  HomeComponent() {
    navigatorService.headWidget = HomeComponentHead();
    navigatorService.bodyWidget = HomeComponentBody();
    navigatorService.currentPage = "Home";
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout();
  }
}
