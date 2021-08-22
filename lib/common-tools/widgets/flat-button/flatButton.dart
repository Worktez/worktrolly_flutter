import 'package:flutter/material.dart';
import 'package:worktrolly_flutter/services/ThemeService/ThemeService.dart';

class FlatButtonWidget extends StatelessWidget {
  final String btnText;
  final Function onPress;

  FlatButtonWidget({required this.btnText, required this.onPress});

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: secondaryMainColor,
    primary: secondaryFontColor,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: flatButtonStyle,
        onPressed: (() => onPress()),
        child: Text(btnText),
      ),
    );
  }
}
