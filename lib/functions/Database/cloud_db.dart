import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import '../task_data.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

DatabaseReference databaseRef = FirebaseDatabase.instance.reference();

String gname;
String fname;
String tval;

class Functions {
  void createData({
    @required String GroupName,
    @required String name,
    @required String value,
  }) {
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

  Future DeleteData({
    @required String GroupName,
  }) async {
    try {
      await databaseRef.child(GroupName).remove();
    } catch (e) {
      print('cloud error : $e');
    }
  }

  Future<void> alert({@required context}) async {
    await Alert(
        context: context,
        title: "Create",
        content: AlertColumn(),
        buttons: [
          DialogButton(
            onPressed: () {
              Provider.of<Data>(context, listen: false).updateGroupname(gname);
              Provider.of<Data>(context, listen: false).updateName(fname);
              Provider.of<Data>(context, listen: false).updateVlaue(tval);
              Provider.of<Data>(context, listen: false)
                  .createSwitch(fname, gname);

              return Navigator.pop(context);
            },
            child: Text(
              "CREATE",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
    createData(
      GroupName: Provider.of<Data>(context, listen: false).groupname,
      name: Provider.of<Data>(context, listen: false).name,
      value: Provider.of<Data>(context, listen: false).value,
    );
  }
}

class AlertColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            icon: Icon(Icons.account_circle),
            labelText: 'Group Name',
          ),
          onChanged: (value) {
            gname = value;
          },
        ),
        TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.account_circle),
            labelText: 'Name',
          ),
          onChanged: (value) {
            fname = value;
          },
        ),
        TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            labelText: 'Value',
          ),
          onChanged: (number) {
            tval = number;
          },
        ),
      ],
    );
  }
}
