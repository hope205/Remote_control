import 'package:flutter/material.dart';
import 'package:remote_control/functions/local_db.dart';
import 'functions/Database_functions.dart';
import 'package:provider/provider.dart';
import 'functions/task_data.dart';

Functions Database = Functions();

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  Map<String, String> newName = {};

  Future _nameFuture;

  getName() async {
    final _nameData = await DBProvider.db.getName();
    List<Map> result = await DBProvider.db.getName();
    for (int i = 0; i < result.length; i++) {
      var x = result[i]['name'];
      var b = result[i]['group'];
      await Provider.of<Data>(context, listen: false).createStartSwitch(x);
    }
    // await DBProvider.db.deleteDatabse();
    return true;
  }

  @override
  void initState() {
    super.initState();
    _nameFuture = getName();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
