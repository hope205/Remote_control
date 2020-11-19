import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  String groupname = '';
  String name = '';
  String value = '';

  bool status1 = false;

  List<bool> status = [];

  List<FlutterSwitch> Switchs = [];

  void AddSwitch() {}

  void changStat(bool value) {
    status1 = value;
    notifyListeners();
  }

  void updateGroupname(String text) {
    groupname = text;

    notifyListeners();
  }

  void updateName(String mane1) {
    name = mane1;

    notifyListeners();
  }

  void updateVlaue(String val) {
    value = val;
    notifyListeners();
  }
}
