import 'package:flutter/material.dart';
import 'package:worktrolly_flutter/interface/userInterface.dart';

class HomeComponentBody extends StatefulWidget {
  const HomeComponentBody({Key? key}) : super(key: key);

  @override
  _HomeComponentBodyState createState() => _HomeComponentBodyState();
}

class _HomeComponentBodyState extends State<HomeComponentBody> {
  var displayName = "No name";

  @override
  void initState() {
    print("Starting Home Body");
    getDisplayName();
    super.initState();
  }

  getDisplayName() {
    print("Getting user name");
    print(userInterface.appKey);
    if (userInterface.displayName != null) {
      setState(() {
        displayName = userInterface.displayName!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(displayName),
    );
  }
}
