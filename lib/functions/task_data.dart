import 'Database/local_db.dart';
import 'package:flutter/material.dart';
import 'Widget.dart';
import 'Database/cloud_db.dart';

// this class contains the functions needed to manage the state of your app

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

  List<Content> Switches = [];

  // Future createSwitch(String itemName, String groupd) async {
  //   await DBProvider.db.CreateNewName(newName: itemName, groups: groupd);
  //   createStatus(itemName);
  //   Switches.add(Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Row(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Text(itemName),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child:
  //               // Switchs(name: itemName),
  //               GestureDetector(
  //             child: Switchs(name: itemName),
  //             onLongPress: () async {
  //               await DeleteSwitch(itemName, groupd);
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   ));
  //
  //   notifyListeners();
  // }

  Future createSwitch(String itemName, String groupd) async {
    await DBProvider.db.CreateNewName(newName: itemName, groups: groupd);
    createStatus(itemName);
    Switches.add(Content(
      item: itemName,
      name: groupd,
    ));

    notifyListeners();
  }

  void createStartSwitch(String itemName, String groupd) {
    // await DBProvider.db.CreateNewName(newName: itemName, groups: groupd);
    createStatus(itemName);
    Switches.add(Content(
      item: itemName,
      name: groupd,
    ));

    notifyListeners();
  }

  Future DeleteSwitch(
    String itemName,
    String group,
  ) async {
    Switches.remove(Content(
      item: itemName,
      name: group,
    ));
    await cloud.DeleteData(GroupName: group);

    await DBProvider.db.DeleteName(itemName);

    print('deleted');

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
    int state;
    status[identity] = value;
    if (value == true) {
      cloud.updateData(GroupName: null, value: 1);
    } else {
      cloud.updateData(GroupName: null, value: 0);
    }

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
