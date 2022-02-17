import 'dart:ui';

import 'package:dxter/views/categories.dart';
import 'package:dxter/views/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FindWorker extends StatefulWidget {
  const FindWorker({Key? key}) : super(key: key);

  @override
  _FindWorkerState createState() => _FindWorkerState();
}

class _FindWorkerState extends State<FindWorker> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(40)),
              child: TabBar(
                  indicator: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(30)),
                  tabs: [
                    Tab(text: 'Categories'),
                    Tab(text: 'Services'),
                  ]),
            ),
            Expanded(
              child: TabBarView(children: [
                Categories(),
                Services(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
