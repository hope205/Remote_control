import 'Database/local_db.dart';
import 'package:flutter/material.dart';
import 'switchs.dart';
import 'Database/cloud_db.dart';

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
            child:
                // Switchs(name: itemName),
                GestureDetector(
              child: Switchs(name: itemName),
              onLongPress: () async {
                await DeleteSwitch(itemName, groupd);
              },
            ),
          ),
        ],
      ),
    ));

    notifyListeners();
  }

  void createStartSwitch(String itemName, String groupd) {
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
            child:
                // Switchs(name: itemName),
                GestureDetector(
                    child: Switchs(name: itemName),
                    onLongPress: () async {
                      await DeleteSwitch(itemName, groupd);
                    }),
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

    var x;
    var b;
    // page
    List<Map> result = await DBProvider.db.getName();
    int len = result.length;
    if (len == null) {
      bool value = true;
    }
    for (int i = 0; i < len; i++) {
      x = result[i]['name'];
      b = result[i]['group'];
    }
    createStartSwitch(x, b);

    notifyListeners();
  }

  Future DeleteAllSwitch() async {
    List<Map> result = await DBProvider.db.getName();
    for (int i = 0; i < result.length; i++) {
      var x = result[i]['name'];
      var b = result[i]['group'];
      DeleteSwitch(x, b);
    }
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
