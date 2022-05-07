import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//
import '../animation/fadeanimation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// CURRENT FIREBASE USER
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    /// CURRENT WIDTH AND HEIGHT
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    ///
    return Scaffold(
      /// APP BAR
      appBar: AppBar(
        title: const Text("HOME"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: w,
        child: Column(
          children: [
            /// FLUTTER IMAGE
            FadeAnimation(
              delay: 1,
              child: Container(
                margin: const EdgeInsets.only(right: 35, bottom: 20, top: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Flutter.png")),
                ),
                height: h / 4,
                width: w / 1.5,
              ),
            ),

            /// WELCOME TEXT
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: FadeAnimation(
                delay: 1.5,
                child: const Text(
                  "Welcome Dude",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),

            /// SIGN IN TEXT
            FadeAnimation(
              delay: 2,
              child: Text(
                "signed In as: " + user.email!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            /// LOG OUT BUTTON
            FadeAnimation(
                delay: 2.5,
                child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: const Text("Log out")))
          ],
        ),
      ),
    );
  }
}
