import 'dart:convert';
import 'package:dxter/widgets/tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../widgets/input_field.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24), color: Colors.white),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      TablerIcons.search,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ),
                  Expanded(child: SearchField(hint: 'Find a service')),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(child: buildServices(context)),
        ],
      ),
    )));
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
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    return ServiceTile(
                      image: entries[index]['image'],
                      name: entries[index]['name'],
                      category: entries[index]['category'],
                      // hands: entries[index]['hands'],
                    );
                  });
            }
        }
      });
}
