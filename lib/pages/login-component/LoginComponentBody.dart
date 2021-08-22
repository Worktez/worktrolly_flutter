import 'package:flutter/material.dart';
import 'package:worktrolly_flutter/common-tools/widgets/flat-button/flatButton.dart';
import 'package:worktrolly_flutter/services/AuthService/authservice.dart';
import 'package:worktrolly_flutter/services/ThemeService/ThemeService.dart';

class LoginComponentBody extends StatefulWidget {
  const LoginComponentBody({Key? key}) : super(key: key);

  @override
  _LoginComponentBodyState createState() => _LoginComponentBodyState();
}

class _LoginComponentBodyState extends State<LoginComponentBody> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final _priceFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _priceFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Text(
                "Login",
                textAlign: TextAlign.center,
                style: headingTextStyle,
              ),
              // Add TextFormFields and ElevatedButton here.
              TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: "Email"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
              ),
              TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: "Password"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.visiblePassword,
                focusNode: _priceFocusNode,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: FlatButtonWidget(
                  btnText: "submit",
                  onPress: () => {authService.signInWithGogleWeb()},
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
                child: FlatButtonWidget(
                  btnText: "Google",
                  onPress: () => {authService.signInWithGogleWeb()},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
