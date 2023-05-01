import 'package:dxter/controllers/google_auth.dart';
import 'package:dxter/views/categories.dart';
import 'package:dxter/views/intro.dart';
import 'package:dxter/views/employer/e_base.dart';
import 'package:dxter/views/employer/e_home.dart';
import 'package:dxter/views/employer/post_job.dart';
import 'package:dxter/views/services.dart';
import 'package:dxter/views/profile.dart';
import 'package:dxter/views/settings.dart';
import 'package:dxter/widgets/login.dart';
import 'package:dxter/widgets/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'views/contractor/post_service.dart';
import 'views/contractor/w_base.dart';
import 'views/contractor/w_contracts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Settings.init(cacheProvider: _customCacheProvider);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            primaryColor: Colors.black,
            secondaryHeaderColor: Colors.grey[700],
            colorScheme: ColorScheme.fromSwatch(),
            backgroundColor: Colors.grey.shade200,
            textTheme: const TextTheme(
                headline1: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                headline2: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                bodyText1:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                bodyText2:
                    TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
                button: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          ),
          title: 'Dxter',
          initialRoute: '/',
          routes: {
            '/': (context) => Intro(),
            // '/w-base': (context) => WBase(),
            '/e-base': (context) => EBase(),
            '/e-home': (context) => EHome(),
            '/w-base': (context) => WBase(),
            '/w-contracts': (context) => WContracts(),
            '/signup': (context) => SignUp(),
            '/login': (context) => Login(),
            '/new-hire': (context) => PostJob(),
            '/post-service': (context) => PostService(),
            '/categories': (context) => Categories(),
            '/services': (context) => Services(),
            '/view-profile': (context) => Profile(),
            '/edit-profile': (context) => EditProfile(),
            '/settings': (context) => SettingsPage(),
          },
        ),
      );
}
