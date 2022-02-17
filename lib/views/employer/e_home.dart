import 'dart:convert';

import 'package:dxter/widgets/login.dart';
import 'package:dxter/widgets/sign_up.dart';
import 'package:dxter/widgets/tiles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../../widgets/drawer.dart';
import '../../widgets/input_field.dart';
import 'e_drawer.dart';

class EHome extends StatelessWidget {
  const EHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: EDrawer(),
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                      'Something Went Wrong! Please close the app and reopen it!'));
            } else if (snapshot.hasData) {
              return SafeArea(
                  child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                // color: Colors.grey[200],
                child: Column(
                  children: [
                    //
                    Expanded(
                      child: ListView(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () =>
                                        Scaffold.of(context).openDrawer(),
                                    icon: Icon(TablerIcons.menu)),
                                Expanded(child: searcher(context)),
                                IconButton(
                                    onPressed: () =>
                                        Scaffold.of(context).openDrawer(),
                                    icon: Icon(TablerIcons.bell)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12),
                              child: Text('Popular services',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ),
                            Container(
                                height: 180, child: buildServices(context)),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 20),
                              child: Text('Available hands',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ),
                            Container(
                              height: 480,
                              child: buildWorkers(context),
                            ),
                          ]),
                    )
                  ],
                ),
              ));
            } else {
              return Login();
            }
          }),
        ));
  }

  Padding searcher(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
              child: Icon(TablerIcons.search, color: Colors.grey, size: 14),
            ),
            Expanded(child: SearchField(hint: 'Find a service...')),
          ],
        ),
      ),
    );
  }

  Widget buildServices(context) => FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/data/services.json'),
      builder: (context, snapshot) {
        final entries = json.decode(snapshot.data.toString());
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ));
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text('Oopsie!!! there was an error :(.'),
              );
            } else {
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    return PopularTile(
                      image: entries[index]['image'],
                      name: entries[index]['name'],
                    );
                  });
            }
        }
      });

  Widget buildWorkers(context) => FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString('assets/data/workers.json'),
      builder: (context, snapshot) {
        final entries = json.decode(snapshot.data.toString());
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ));
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text('Oopsie!!! there was an error :(.'),
              );
            } else {
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    return WorkerTile(
                      image: entries[index]['image'],
                      name: entries[index]['name'],
                      profession: entries[index]['profession'],
                      rate: entries[index]['rate'],
                      eta: entries[index]['eta'],
                    );
                  });
            }
        }
      });
}
