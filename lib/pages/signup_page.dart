// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/widgets/custom_button.dart';
import 'package:login_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 61, 107),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Signup',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                    ontap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          UserCredential user = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: email!, password: password!);
                          Navigator.pop(context);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('there is an error, please try again'),
                            ),
                          );
                        }
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Success'),
                        ));
                      }
                    },
                    text: 'Signup'),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        '  Login',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
