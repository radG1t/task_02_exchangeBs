import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
    var width = MediaQuery.of(context).size.width;

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
                          return 'Please enter a valid address.';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Form(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        hintText: 'password',
                        prefixIcon: Icon(Icons.lock_outline),
                        //   suffixIcon : IconButton(icon:Icon(_isObsecure ? I) ,),
                      ),
                      controller: passwordController,
                      obscureText: _isObsecure,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
