import 'package:firebase_database/firebase_database.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

DatabaseReference databaseRef = FirebaseDatabase.instance.reference();

String groupname;
String name;
String value;

class Functions {
  Future<void> createData(
      {@required String GroupName,
      @required String name,
      @required BuildContext context,
      @required int value}) async {
    databaseRef.child(GroupName).set({
      "Name": name,
      "State": value,
    });
  }

  void updateData({@required String GroupName, @required int value}) {
    databaseRef.child(GroupName).set({
      "State": value,
    });
  }

  Future<void> alert({@required context}) async {
    await Alert(
        context: context,
        title: "Create",
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Group Name',
              ),
              onChanged: (value) {
                groupname = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Name',
              ),
              onChanged: (value) {
                name = value;
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Value',
              ),
              onChanged: (val) {
                value = val;
              },
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "CREATE",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
