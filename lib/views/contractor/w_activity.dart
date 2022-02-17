import 'package:flutter/material.dart';

class WActivity extends StatelessWidget {
  const WActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 16),
            buildSummary(context),
            SizedBox(height: 16),
            buildJobs(context),
            SizedBox(height: 16),
            buildRatings(context),
            SizedBox(height: 16),
            buildSummary(context),
          ],
        ),
      ),
    );
  }

  Widget buildSummary(context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.red[50]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Today',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 8),
          Text(DateTime.now().toString()),
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Active jobs'),
                    Text(
                      '5',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Clients'),
                    Text(
                      '2',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Completed jobs'),
                    Text(
                      '4',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildJobs(context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.green[50]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Jobs',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Roofing'),
                    Text(
                      '\$500',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Furniture installation'),
                    Text(
                      '\$200',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Closet Woodframe fix'),
                    Text(
                      '\$50',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRatings(context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blue[50]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Rating Sheet',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Karen Smith'),
                    Text(
                      '1',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('David Rudiger'),
                    Text(
                      '3',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ashley Grey'),
                    Text(
                      '4.5',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
