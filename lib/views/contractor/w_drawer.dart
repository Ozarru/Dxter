// ignore_for_file: prefer_const_constructors

import 'package:dxter/widgets/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/google_auth.dart';

class WDrawer extends StatelessWidget {
  const WDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                color: Colors.grey[100],
                child: Userbadge()),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  DrawerTile(
                    label: 'Home',
                    icon: TablerIcons.home_2,
                    route: '/',
                  ),
                  DrawerTile(
                    label: 'Give a hand',
                    icon: Icons.handyman_outlined,
                    route: '/post-service',
                  ),
                  DrawerTile(
                    label: 'Stats',
                    icon: TablerIcons.chart_pie,
                    route: '/stats',
                  ),
                  DrawerTile(
                    label: 'Work history',
                    icon: TablerIcons.history,
                    route: '/activity',
                  ),
                  DrawerTile(
                    label: 'Profile',
                    icon: TablerIcons.user,
                    route: '/profile',
                  ),
                  DrawerTile(
                    label: 'Settings',
                    icon: TablerIcons.settings,
                    route: '/settings',
                  ),
                  DrawerTile(
                    label: 'Help & Support',
                    icon: TablerIcons.help,
                    route: '/settings',
                  ),
                  DrawerTile(
                    label: 'Terms of use',
                    icon: Icons.new_releases,
                    route: '/terms',
                  ),
                  DrawerTile(
                    label: 'Privacy policy',
                    icon: Icons.privacy_tip,
                    route: '/policy',
                  ),
                  DrawerTile(
                    label: 'Use as client',
                    icon: Icons.person,
                    route: '/e-base',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: TextButton.icon(
                      onPressed: () {
                        debugPrint('Login out now.');
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.logout();
                      },
                      icon: Icon(TablerIcons.logout),
                      label: Text('Logout'),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.all(16),
                          primary: Colors.white,
                          backgroundColor: Theme.of(context).primaryColor),
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

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {required this.label, required this.icon, required this.route});
  final String label;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black45),
      title: Text(
        label,
        style: TextStyle(fontSize: 15),
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class Userbadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return user.isAnonymous
        ? ListTile(
            leading: Icon(
              TablerIcons.user,
              size: 24,
            ),
            title: Text(
              'Anonymous',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              'Sign in to get the most out of our app',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            trailing: IconButton(
              onPressed: () => Get.to(SignUp()),
              icon: Icon(TablerIcons.login),
            ),
          )
        : ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            title: Text(
              user.displayName!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              'Welcome',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          );
  }
}
