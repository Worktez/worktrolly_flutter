import 'package:flutter/material.dart';
import 'package:worktrolly_flutter/common-tools/widgets/flat-button/flatButton.dart';
import 'package:worktrolly_flutter/services/AuthService/authservice.dart';

class ProfileComponent extends StatefulWidget {
  const ProfileComponent({Key? key}) : super(key: key);

  @override
  _ProfileComponentState createState() => _ProfileComponentState();
}

class _ProfileComponentState extends State<ProfileComponent> {
  _ProfileComponentState();

  @override
  Widget build(BuildContext context) {
    return new FlatButtonWidget(
      btnText: "Sign Out",
      onPress: (() {
        authService.signOut();
        // getAuthState(context);
      }),
    );
  }
}
