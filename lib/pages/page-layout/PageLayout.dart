import 'package:flutter/material.dart';
import 'package:worktrolly_flutter/services/NavigatorService/NavigatorService.dart';
import 'package:worktrolly_flutter/services/ThemeService/ThemeService.dart';

class PageLayout extends StatelessWidget {
  PageLayout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: appLogo,
        actions: [
          Container(
            child: navigatorService.headWidget,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 850,
              child: navigatorService.bodyWidget,
            )
          ],
        ),
      ),
    );
  }
}
