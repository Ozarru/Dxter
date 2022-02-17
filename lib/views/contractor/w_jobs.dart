import 'dart:convert';
import 'package:dxter/utils/jobs.dart';
import 'package:dxter/views/contractor/w_job_details.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';

import 'package:dxter/models/menu_item.dart';
import 'package:dxter/views/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../../models/job.dart';
import '../../utils/menu_items.dart';
import '../../widgets/drawer.dart';
import '../../widgets/input_field.dart';
import '../../widgets/tiles.dart';

class FindJob extends StatefulWidget {
  const FindJob({Key? key}) : super(key: key);

  @override
  State<FindJob> createState() => _FindJobState();
}

class _FindJobState extends State<FindJob> {
  List<Job> jobs = allJobs;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildPaginatedSearch(),
          Expanded(
            child: buildList(jobs),
          )
        ],
      ),
    );
  }

  Widget buildPaginatedSearch() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: Colors.white),
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14),
              child: Icon(TablerIcons.search, color: Colors.grey, size: 16),
            ),
            Expanded(
                child: SearchField(
              hint: 'Find a job',
              onChanged: searchDataset,
            )),
            PopupMenuButton<MenuItem>(
              icon: Icon(
                TablerIcons.filter,
                color: Colors.grey,
              ),
              itemBuilder: (context) =>
                  [...MenuItems.items.map(buildItem).toList()],
            )
          ],
        ),
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) {
    return PopupMenuItem(
      child: Row(
        children: [
          Icon(
            item.icon,
            color: Colors.grey,
          ),
          Spacer(),
          Text(item.text),
        ],
      ),
    );
  }

  Widget buildList(jobs) {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          // print(job);
          return GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => WJobDetails(job: job))),
            child: JobTile(
              title: job.title,
              client: job.client,
              place: job.place,
              rate: job.rate,
              budget: job.budget,
              payvet: job.payvet,
              xp: job.xp,
              // hands: jobs[index]['hands'],
            ),
          );
        });
  }

  void searchDataset(String query) {
    query = query.toLowerCase();
    final suggestions = allJobs.where((job) {
      final jobTitle = job.title.toLowerCase();
      final input = query;

      return jobTitle.contains(input);
    }).toList();

    setState(() {
      jobs = suggestions;
    });
  }
}
