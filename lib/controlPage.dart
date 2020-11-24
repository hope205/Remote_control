import 'package:flutter/material.dart';
import 'package:remote_control/functions/Database/local_db.dart';
import 'functions/Database/cloud_db.dart';
import 'package:provider/provider.dart';
import 'functions/task_data.dart';
import 'functions/Database/local_db.dart';

Functions database = Functions();

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  String value;
  Future tem;

  Future getName() async {
    // await DBProvider.db.database;
    List<Map> result = await DBProvider.db.getName();
    int len = result.length;
    if (len == null) {
      print('no list');
      value = 'not';
    }
    for (int i = 0; i < len; i++) {
      var x = result[i]['name'];
      var b = result[i]['group'];

      Provider.of<Data>(context, listen: false).createStartSwitch(x, b);
    }
    value = 'yes';
  }

  @override
  void initState() {
    super.initState();
    tem = getName();
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
            database.alert(context: context);
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
                  child: FutureBuilder(
                    future: tem,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Container();
                        case ConnectionState.done:
                          return ListView(
                            children: Provider.of<Data>(context, listen: true)
                                .Switches,
                          );
                        default:
                          return Container();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
