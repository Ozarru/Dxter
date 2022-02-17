import 'package:dxter/widgets/tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 8,
              ),
              const CatTile(
                  title: 'Construction',
                  icon: TablerIcons.building,
                  route: '/cleanup',
                  subtitle:
                      'Click to see all available construction services.'),
              Divider(),
              const CatTile(
                  title: 'Maintenance & Repair',
                  icon: TablerIcons.tool,
                  route: '/electric',
                  subtitle:
                      "Cick to see all available maintenace and repair services."
                  // 'Generators & other Electrical/Electronics repair services round the clock'
                  ),
              Divider(),
              const CatTile(
                  title: 'Renovation',
                  icon: TablerIcons.new_section,
                  route: '/carpentry',
                  subtitle: 'Click to see all available renovation services.'),
              Divider(),
              const CatTile(
                  title: 'Decoration',
                  icon: TablerIcons.paint,
                  route: '/decoration',
                  subtitle: 'Click to see all available decoration services.'),
              Divider(),
              const CatTile(
                  title: 'Customization',
                  icon: Icons.dashboard_customize,
                  route: '/home-decor',
                  subtitle:
                      'Click to see all available customization services.'),
              Divider(),
              const CatTile(
                  title: 'Food & Beverage',
                  icon: TablerIcons.tools_kitchen_2,
                  route: '/foodies',
                  subtitle: 'Click to see all available catering services.'),
              Divider(),
              const CatTile(
                  title: 'Event Management',
                  icon: Icons.music_note_outlined,
                  route: '/party',
                  subtitle: 'Click to see all available event services.'),
            ],
          )),
    ));
  }
}
