import 'package:flutter/material.dart';
import 'package:worktrolly_flutter/pages/home-component/profile-component/ProfileComponent.dart';

class HomeComponentHead extends StatelessWidget {
  const HomeComponentHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ProfileComponent(),
    );
  }
}
