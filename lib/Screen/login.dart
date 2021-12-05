import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_list/Screen/home.dart';
import 'package:movies_list/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_button/sign_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailEdittingController =
      new TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  prefsTrue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }

  moveToHomeGoogle(BuildContext context) {
    googleSign().then((user) {
      // ignore: unnecessary_null_comparison
      if (user != null) {
        return Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    HomeScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = Offset(0.0, 1.0);
                  var end = Offset.zero;
                  var tween = Tween(begin: begin, end: end);
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                }),
            (route) => false);
      } else {
        return CircularProgressIndicator.adaptive();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Container(
                    child: Text(
                      "Welcome To",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Container(
                    child: Text(
                      "MOVIES LIST",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                  height: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SignInButton(
                    buttonType: ButtonType.google,
                    onPressed: () {
                      moveToHomeGoogle(context);
                      prefsTrue();
                    },
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
