import 'local_db.dart';
import 'package:flutter/material.dart';
import 'switchs.dart';
import 'cloud_db.dart';

Functions cloud = Functions();

class Data extends ChangeNotifier {
  String groupname = '';
  String name = '';
  String value = '';

  // switch functions

  List<Map> result;

  Map<String, bool> status = {
    'status1': false,
  };

  List<Padding> Switches = [];

  Future createSwitch(String itemName, String groupd) async {
    await DBProvider.db.newName(newName: itemName, groups: groupd);
    createStatus(itemName);
    Switches.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(itemName),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Switchs(name: itemName),
          ),
        ],
      ),
    ));

    notifyListeners();
  }

  void createStartSwitch(String itemName) {
    createStatus(itemName);
    Switches.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(itemName),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Switchs(name: itemName),
          ),
        ],
      ),
    ));
    notifyListeners();
  }

  Future DeleteSwitch(String itemName, String group) async {
    await cloud.DeleteData(GroupName: group);

    await DBProvider.db.DeleteName(itemName);
    Switches.remove(itemName);
    print('deleted');

    notifyListeners();
  }

  void createStatus(String name) {
    status[name] = false;

    notifyListeners();
  }

  bool SwitchState(String identity) {
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
