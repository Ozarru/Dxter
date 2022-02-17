import 'package:dxter/controllers/google_auth.dart';
import 'package:dxter/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Spacer(),
            Image(
              image: AssetImage('assets/branding/handb.png'),
              width: 200,
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hello There 😉! \nWelcome To Dxter.',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Sign up to get started.'),
            ),
            Spacer(),
            Center(
                child: ElevatedButton.icon(
                    onPressed: () {
                      print('pressed it was, and impresed i am 🙂');
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogin();
                      print('Logged in, you are! ');
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.amber[900],
                    ),
                    label: Text('Sign up with Google'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[200],
                      onPrimary: Colors.black,
                      minimumSize: Size(double.infinity, 50),
                    ))),
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Already got an account?"),
                  GestureDetector(
                    onTap: () => Get.to(Login()),
                    child: Text(
                      "Login here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
