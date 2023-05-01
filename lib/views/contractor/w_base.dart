import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dxter/views/contractor/w_activity.dart';
import 'package:dxter/views/contractor/w_comms.dart';
import 'package:dxter/views/contractor/w_contracts.dart';
import 'package:dxter/views/contractor/w_jobs.dart';
import 'package:dxter/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import 'w_drawer.dart';

class WBase extends StatefulWidget {
  const WBase({Key? key}) : super(key: key);

  @override
  _WBaseState createState() => _WBaseState();
}

class _WBaseState extends State<WBase> {
  int _index = 0;
  final _screens = [
    FindJob(),
    WContracts(),
    Comms(),
    WActivity(),
  ];
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
      //       IconButton(
      //           onPressed: () {},
      //           icon: Icon(
      //             TablerIcons.bell,
      //             color: Colors.grey,
      //           ))
      //     ]),
      drawer: WDrawer(),
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
            icon: Icon(TablerIcons.clipboard_list),
            title: Text('Jobs'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.work_outline_rounded),
            title: Text('Contracts'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(TablerIcons.message_2),
            title: Text('Messages'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(TablerIcons.chart_bar),
            title: Text('Activity'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
