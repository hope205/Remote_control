import 'package:flutter/material.dart';
import 'package:remote_control/functions/Database/local_db.dart';
import 'functions/Database/cloud_db.dart';
import 'package:provider/provider.dart';
import 'functions/task_data.dart';
import 'functions/Database/local_db.dart';

Functions Database = Functions();

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  Map<String, String> newName = {};

  Future _nameFuture;

  getName() async {
    await DBProvider.db.database;
    List<Map> result = await DBProvider.db.getName();
    int len = result.length;
    if (len == null) {
      bool value = true;
    }
    for (int i = 0; i < len; i++) {
      var x = result[i]['name'];
      var b = result[i]['group'];

      await Provider.of<Data>(context, listen: false).createStartSwitch(x, b);
    }
    return true;
  }
  // await DBProvider.db.deleteDatabse();

  @override
  void initState() {
    super.initState();
    _nameFuture = getName();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                await Provider.of<Data>(context, listen: false)
                    .DeleteAllSwitch();
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Database.alert(context: context);
            // Database.createData(GroupName: 'test', name: 'led', value: '0');
          },
          child: Icon(Icons.add),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 200,
              ),
              Expanded(
                child: Container(
                  width: 200,
                  child: ListView(
                    children: Provider.of<Data>(context, listen: true).Switches,
                  ),

                  // Provider.of<Data>(context, listen: true).Switches,
                  // ListView.builder(
                  //   itemBuilder: (context, index) {
                  //     return true;
                  //   },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
