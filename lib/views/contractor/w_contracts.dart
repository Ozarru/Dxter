import 'dart:convert';
import 'dart:ui';

import 'package:dxter/models/menu_item.dart';
import 'package:dxter/views/contractor/w_contract_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../../models/contract.dart';
import '../../utils/contracts.dart';
import '../../utils/menu_items.dart';
import '../../widgets/drawer.dart';
import '../../widgets/input_field.dart';
import '../../widgets/tiles.dart';

class WContracts extends StatefulWidget {
  const WContracts({Key? key}) : super(key: key);

  @override
  State<WContracts> createState() => _WContractsState();
}

class _WContractsState extends State<WContracts> {
  final controller = TextEditingController();
  List<Contract> contracts = allContracts;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildPaginatedSearch(),
          Expanded(
            child: buildList(contracts),
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
              hint: 'Find a contract',
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

  Widget buildList(contracts) {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: contracts.length,
        itemBuilder: (context, index) {
          final contract = contracts[index];
          // print(contract);
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WContractDetails(contract: contract))),
            child: ContractTile(
              title: contract.title,
              client: contract.client,
              place: contract.place,
              rate: contract.rate,
              budget: contract.budget,
              daysAgo: contract.daysAgo,
              // hands: contracts[index]['hands'],
            ),
          );
        });
  }

  void searchDataset(String query) {
    query = query.toLowerCase();
    final suggestions = allContracts.where((contract) {
      final contractTitle = contract.title.toLowerCase();
      final input = query;

      return contractTitle.contains(input);
    }).toList();

    setState(() {
      contracts = suggestions;
    });
  }
}
