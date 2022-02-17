import 'package:dxter/utils/user_preferences.dart';
import 'package:dxter/widgets/drawer.dart';
import 'package:dxter/widgets/tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';

import '../controllers/google_auth.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              // height: MediaQuery.of(context).size.height / 4,
              // color: Color(0xff1b4188),
              child: Userbadge(),
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
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
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text('General',
                        style: Theme.of(context).textTheme.headline2),
                  ),
                  Divider(),
                  const SettingsTile(
                      title: 'Language',
                      icon: Icons.translate,
                      route: '/language'),
                  const SettingsTile(
                      title: 'Currency',
                      icon: Icons.attach_money,
                      route: '/currency'),
                  const SettingsTile(
                      title: 'Notifications',
                      icon: Icons.notifications_outlined,
                      route: '/notify'),
                  const SettingsTile(
                      title: 'My Stats',
                      icon: TablerIcons.chart_bar,
                      route: '/stats'),
                  const SettingsTile(
                      title: 'Share Dxter',
                      icon: Icons.ios_share,
                      route: '/share'),
                  const SettingsTile(
                      title: 'About',
                      icon: Icons.info_outline,
                      route: '/about'),
                  const SettingsTile(
                      title: 'Terms of service',
                      icon: Icons.policy_outlined,
                      route: '/terms'),
                  const SettingsTile(
                      title: 'Privacy Policy',
                      icon: Icons.lock_outline,
                      route: '/policies'),
                  const SettingsTile(
                      title: 'Help', icon: Icons.help_outline, route: '/help'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUserTile(BuildContext context) {
    return Userbadge();
  }
}
