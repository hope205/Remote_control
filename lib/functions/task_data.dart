import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';
import 'switchs.dart';

class Data extends ChangeNotifier {
  String groupname = '';
  String name = '';
  String value = '';

  // switch functions

  Map<String, bool> status = {
    'status1': false,
  };

  List<Switchs> Switches = [];

  void createSwitch(String itemName) {
    createStatus(itemName);
    Switches.add(Switchs(name: itemName));
    print(itemName);
    notifyListeners();
  }

  void createStatus(String name) {
    status[name] = false;
    print(status[name]);
    notifyListeners();
  }

  bool SwitchState(String identity) {
    print('identit : ${status[identity]}');
    return status[identity];
  }

  void changStatus(bool value, String identity) {
    // bool x = identity;
    status[identity] = value;
    notifyListeners();
  }

  // Database functions

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
