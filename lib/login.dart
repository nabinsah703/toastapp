import 'package:flutter/material.dart';
import 'package:toast_message/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        child: Builder(builder: (context) {
          return Column(
            children: [
              TextFormField(
                controller: username,
                validator: (CurrentValue) {
                  var nonNullValue = CurrentValue ?? '';
                  if (nonNullValue.isEmpty) {
                    return ("username is required");
                  }
                  // if (!nonNullValue.contains("@")) {
                  //   return ("username should contains @");
                  // }
                  return null;
                },
              ),
              TextFormField(
                controller: password,
                validator: (PassCurrentValue) {
                  RegExp regex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  var passNonNullValue = PassCurrentValue ?? "";
                  if (passNonNullValue.isEmpty) {
                    return ("Password is required");
                  } else if (passNonNullValue.length < 6) {
                    return ("Password Must be more than 5 characters");
                  } else if (!regex.hasMatch(passNonNullValue)) {
                    return ("Password should contain upper,lower,digit and Special character ");
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (Form.of(context)?.validate() ?? false) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const HomePage()));
                  }

                  Fluttertoast.showToast(
                      msg: "Signup successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM_RIGHT,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: const Text("Login"),
              ),
            ],
          );
        }),
      ),
    );
  }
}
