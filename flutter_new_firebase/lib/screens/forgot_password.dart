import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

///
import '../animation/fadeanimation.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  /// TextField Controller
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  /// FireBase Reset Password Method
  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());

      /// Showing Message That user enters email correctly and reset password will be sent
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Password reset link sent! Check your Email"),
      ));

      /// After 2 seconds we automatically pop forgot screen
      Future.delayed(const Duration(seconds: 2), () => Navigator.pop(context));

      ///
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);

      /// Showing Error with SnackBar if the user enter the wrong Email or Enter nothing
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Currrent Width and Height
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    ///
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        /// APPBAR
        appBar: AppBar(
          title: const Text("FORGOT PASSWORD"),
          centerTitle: true,
        ),

        /// Body
        body: Padding(
          padding: const EdgeInsets.all(17.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                /// FLUTTER IMAGE
                FadeAnimation(
                  delay: 1,
                  child: Container(
                    margin: const EdgeInsets.only(right: 35),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Flutter.png")),
                    ),
                    height: h / 4,
                    width: w / 1.5,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /// Top Text
                FadeAnimation(
                  delay: 1.5,
                  child: const Text(
                    "Enter Your Email and we will send you a password reset link.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                /// Email TextField
                FadeAnimation(
                  delay: 2.0,
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /// LOG IN BUTTON
                FadeAnimation(
                  delay: 2.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(w / 1.1, h / 15)),
                    onPressed: resetPassword,
                    child: const Text("Reset Password"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
