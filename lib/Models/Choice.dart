import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> tabchoices = const <Choice>[
  const Choice(title: 'CASH', icon: FontAwesomeIcons.wallet),
  const Choice(title: 'SAVINGS', icon: FontAwesomeIcons.piggyBank),
  const Choice(title: 'OTHERS', icon: FontAwesomeIcons.creditCard),
];

List<String> dropdownchoices = <String>["See All", "Incomes", "Expenses"];
