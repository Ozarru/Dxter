import 'dart:convert';
import 'dart:ui';

import 'package:dxter/models/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../../models/job.dart';
import '../../utils/jobs.dart';
import '../../utils/menu_items.dart';
import '../../widgets/drawer.dart';
import '../../widgets/input_field.dart';
import '../../widgets/tiles.dart';

class WJobDetails extends StatelessWidget {
  const WJobDetails({Key? key, required this.job}) : super(key: key);

  final Job job;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text("${job.title}"),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              // color: Colors.black,
            )),
      ),
      body: Container(
        child: buildDetails(job),
      ),
    );
  }

  Widget buildDetails(job) {
    return Center(
      child: Text(job.title),
    );
  }
}
