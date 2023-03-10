import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:task_02/ui/mainWrapper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _fromkey = GlobalKey<FormState>();
  final _fromkey2 = GlobalKey<FormState>();
  final _fromkey3 = GlobalKey<FormState>();
  bool _isObsecure = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset:
          false, // keyboard ke bala miad safhe ro shift Nmikone be bala
      body: Column(
        children: [
          Lottie.asset(
            'assets/waveloop.json',
            height: height * 0.2,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              'Sign Up',
              style: GoogleFonts.ubuntu(
                  fontSize: height * 0.035,
                  color: Theme.of(context).unselectedWidgetColor),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              'Create Account',
              style: GoogleFonts.ubuntu(
                  fontSize: height * 0.03,
                  color: Theme.of(context).unselectedWidgetColor),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Form(
              key: _fromkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      hintText: 'username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter UserName";
                      } else if (value.length < 4) {
                        return "at least enter 4 characters";
                      } else if (value.length > 13) {
                        return "maximum character is 13";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Form(
                    key: _fromkey2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        hintText: 'gmail',
                        prefixIcon: Icon(
                          Icons.email_rounded,
                        ),
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter gmail';
                        } else if (!value.endsWith('@gmail.com')) {
                          return 'Please enter a valid address';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Form(
                    key: _fromkey3,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        hintText: 'password',
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(_isObsecure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObsecure = !_isObsecure;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "try to enter your password";
                        } else if (value.length < 7) {
                          return "at least enter 6 characters";
                        } else if (value.length > 13) {
                          return "maximum length of character is 13";
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: _isObsecure,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    'Creating an account means you\'re okay with our Terms of Services and our Privacy Policy.',
                    style: GoogleFonts.ubuntu(
                        fontSize: 15, color: Colors.grey, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  signupBtn(),
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Text('already have an account ?'),
                    SizedBox(
                      height: 10,
                    ),
                    logInBtn(),
                  ]),
                ],
              ),
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget signupBtn() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onPressed: () {
          if (_fromkey.currentState!.validate() &&
              _fromkey2.currentState!.validate() &&
              _fromkey3.currentState!.validate()) {
            // userProvider.callRegisterApi(nameController.text,
            //     emailController.text, passwordController.text);

            Navigator.pushReplacement(
                this.context,
                MaterialPageRoute(
                  builder: (context) => const MainWrapper(),
                ));
          }
        },
        child: const Text(
          'Sign Up',
        ),
      ),
    );
  }

  Widget logInBtn() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: Colors.blue),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onPressed: () {
          if (_fromkey.currentState!.validate() &&
              _fromkey2.currentState!.validate() &&
              _fromkey3.currentState!.validate()) {
            Navigator.pushReplacement(
                this.context,
                MaterialPageRoute(
                  builder: (context) => const MainWrapper(),
                ));
          }
        },
        child: const Text(
          'log in',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
