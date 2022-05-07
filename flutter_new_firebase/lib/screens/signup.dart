import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//
import '../animation/fadeanimation.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback showLoginScreen;
  const SignUpScreen({Key? key, required this.showLoginScreen})
      : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  /// TextFields Controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  /// Password =! ConfirmPassword
  var aSnackBar = const SnackBar(
    content: Text('The password in not match with confirm password'),
  );

  /// Password & ConfirmPassword is Empty
  var bSnackBar = const SnackBar(
    content: Text('The Password & Confirm Password fields must fill!'),
  );

  /// Confirm Password is Empty
  var cSnackBar = const SnackBar(
    content: Text('The Confirm Password field must fill!'),
  );

  /// Password is Empty
  var dSnackBar = const SnackBar(
    content: Text('The Password field must fill!'),
  );

  /// Email & Confirm Password is Empty
  var eSnackBar = const SnackBar(
    content: Text('The Email & Confirm Password fields must fill!'),
  );

  /// Email is Empty
  var fSnackBar = const SnackBar(
    content: Text('The Email field must fill!'),
  );

  /// Email & password is Empty
  var gSnackBar = const SnackBar(
    content: Text('The Email & Password fields must fill!'),
  );

  /// All Fields Empty
  var xSnackBar = const SnackBar(
    content: Text('You must fill all fields'),
  );

  /// SIGNING UP METHOD TO FIREBASE
  Future signUp() async {
    if (_emailController.text.isNotEmpty &
        _passwordController.text.isNotEmpty &
        _confirmPasswordController.text.isNotEmpty) {
      if (passwordConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(aSnackBar);
      }

      /// In the below, with if statement we have some simple validate
    } else if (_emailController.text.isNotEmpty &
        _passwordController.text.isEmpty &
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(bSnackBar);
    }

    ///
    else if (_emailController.text.isNotEmpty &
        _passwordController.text.isNotEmpty &
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(cSnackBar);
    }

    ///
    else if (_emailController.text.isNotEmpty &
        _passwordController.text.isEmpty &
        _confirmPasswordController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(dSnackBar);
    }

    ///
    else if (_emailController.text.isEmpty &
        _passwordController.text.isNotEmpty &
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(eSnackBar);
    }

    ///
    else if (_emailController.text.isEmpty &
        _passwordController.text.isNotEmpty &
        _confirmPasswordController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(fSnackBar);
    }

    ///
    else if (_emailController.text.isEmpty &
        _passwordController.text.isEmpty &
        _confirmPasswordController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(gSnackBar);
    }

    ///
    else {
      ScaffoldMessenger.of(context).showSnackBar(xSnackBar);
    }
  }

  /// CHECK IF PASSWORD CONFIREMD OR NOT
  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// CURRENT WIDTH AND HEIGHT
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    ///
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        /// APP BAR
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("SIGN UP"),
          centerTitle: true,
        ),

        /// Body
        body: Container(
          margin: const EdgeInsets.all(17),
          width: w,
          height: h,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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

                /// TOP TEXT
                FadeAnimation(
                  delay: 1.5,
                  child: const Text(
                    "Sign Up To the App",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
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
                  height: 15,
                ),

                /// Password TextField
                FadeAnimation(
                  delay: 2.5,
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                /// Confrim Password TextField
                FadeAnimation(
                  delay: 3,
                  child: TextField(
                    obscureText: true,
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Confirm Password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /// SIGN UP BUTTON
                FadeAnimation(
                  delay: 3.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(w / 1.1, h / 15)),
                    onPressed: signUp,
                    child: const Text("Sign Up"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /// LOGIN TEXT
                GestureDetector(
                  onTap: widget.showLoginScreen,
                  child: FadeAnimation(
                    delay: 4,
                    child: RichText(
                      text: TextSpan(
                          text: "Have an account?",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                                text: " Log in",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor))
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
