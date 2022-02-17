import 'package:dxter/models/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class MenuItems {
  static const List<MenuItem> items = [
    itemDate,
    itemCategory,
    itemBudget,
    itemRate,
    itemXp,
    itemPayvet,
  ];

  static const itemDate = MenuItem(
    icon: TablerIcons.calendar,
    text: 'Date',
  );
  static const itemCategory = MenuItem(
    icon: Icons.category_outlined,
    text: 'Category',
  );
  static const itemBudget = MenuItem(
    icon: TablerIcons.wallet,
    text: 'Total budget',
  );
  static const itemRate = MenuItem(
    icon: TablerIcons.currency_dollar,
    text: 'Hourly rate',
  );
  static const itemXp = MenuItem(
    icon: TablerIcons.stars,
    text: 'Experience level',
  );
  static const itemPayvet = MenuItem(
    icon: Icons.verified_outlined,
    text: 'Verification status',
  );
}
