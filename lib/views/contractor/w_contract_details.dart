import 'dart:convert';
import 'dart:ui';

import 'package:dxter/models/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../../models/contract.dart';
import '../../utils/contracts.dart';
import '../../utils/menu_items.dart';
import '../../widgets/drawer.dart';
import '../../widgets/input_field.dart';
import '../../widgets/tiles.dart';

class WContractDetails extends StatelessWidget {
  const WContractDetails({Key? key, required this.contract}) : super(key: key);

  final Contract contract;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text("${contract.title}"),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              // color: Colors.black,
            )),
      ),
      body: Container(
        child: buildDetails(contract),
      ),
    );
  }

  Widget buildDetails(contract) {
    return Center(
      child: Text(contract.title),
    );
  }
}
