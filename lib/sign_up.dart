import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast_message/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Signup",
            // style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: 'Name',
                  label: Text(
                    'Name',
                    style: TextStyle(color: Color.fromARGB(255, 15, 33, 224)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: 'Email',
                  label: Text(
                    'Email',
                    style: TextStyle(color: Color.fromARGB(255, 15, 33, 224)),
                  ),
                  prefixIcon: Icon(Icons.account_circle),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  prefixIcon: Icon(Icons.phone),
                  hintText: 'Mobile No.',
                  label: Text(
                    'Mobile No.',
                    style: TextStyle(color: Color.fromARGB(255, 15, 33, 224)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
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
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: "Password",
                  label: Text(
                    "Password",
                    style: TextStyle(color: Color.fromARGB(255, 15, 33, 224)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: 'Confirm Pasword',
                  label: Text(
                    'Confirm Pasword',
                    style: TextStyle(color: Color.fromARGB(255, 15, 33, 224)),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: (() {
                  {
                    if (Form.of(context)?.validate() ?? true) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const LoginPage()));
                    }
                  }
                  Fluttertoast.showToast(
                      msg: "Signup successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM_RIGHT,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }),
                child: const Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
