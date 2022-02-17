import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dxter/views/employer/find_worker.dart';
import 'package:dxter/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../../widgets/login.dart';
import '../profile.dart';
import '../settings.dart';
import 'e_drawer.dart';
import 'e_home.dart';

class EBase extends StatefulWidget {
  const EBase({Key? key}) : super(key: key);

  @override
  _EBaseState createState() => _EBaseState();
}

class _EBaseState extends State<EBase> {
  bool isClient = true;
  int _index = 0;
  final _screens = [EHome(), FindWorker(), Profile(), SettingsPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     elevation: 0,
      //     backgroundColor: Colors.transparent,
      //     iconTheme: IconThemeData(
      //       color: Colors.black,
      //     ),
      //     actions: [
      //       // searcher(),
      //       IconButton(onPressed: () {}, icon: Icon(TablerIcons.bell))
      //     ]),
      drawer: EDrawer(),
      body: SafeArea(child: _screens[_index]),
      bottomNavigationBar: BottomNavyBar(
        showElevation: false,
        selectedIndex: _index,
        onItemSelected: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(TablerIcons.home_2),
            title: Text('Home'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(TablerIcons.search),
            title: Text('Find'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(TablerIcons.user),
            title: Text('Profile'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(TablerIcons.settings),
            title: Text('Settings'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/new-hire'),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(TablerIcons.plus),
      ),
    );
  }
}
