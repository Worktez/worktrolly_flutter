import 'package:flutter/material.dart';
import 'package:worktrolly_flutter/head-component/profile-component/ProfileComponent.dart';

class HeadComponent extends StatefulWidget {
  const HeadComponent({Key? key}) : super(key: key);

  @override
  _HeadComponentState createState() => _HeadComponentState();
}

class _HeadComponentState extends State<HeadComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ProfileComponent(),
    );
  }
}
