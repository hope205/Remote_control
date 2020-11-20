import 'package:flutter/material.dart';
import 'functions/Database_functions.dart';
import 'package:provider/provider.dart';
import 'functions/task_data.dart';

Functions Database = Functions();

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  String message = 'Light Off';
  bool check = false;
  Color OnColour = Colors.green;
  Color OffColour = Colors.green;

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
          child: Container(
            child: Column(
              // children: [
              //   // Container(
              //   //   height: 300,
              //   //   child: Center(
              //   //     child: Text(
              //   //       message,
              //   //       style: TextStyle(
              //   //         color: Colors.greenAccent,
              //   //         fontWeight: FontWeight.bold,
              //   //         fontSize: 30,
              //   //       ),
              //   //     ),
              //   //   ),
              //   // ),
              //   // MaterialButton(
              //   //   onPressed: () {
              //   //     setState(() {
              //   //       // Database.updateData(GroupName: null, value: null);
              //   //       message = 'Light On';
              //   //     });
              //   //   },
              //   //   color: OnColour,
              //   //   elevation: 7.0,
              //   //   child: Text(
              //   //     'ON',
              //   //     style: TextStyle(
              //   //       color: Colors.white,
              //   //     ),
              //   //   ),
              //   // ),
              //   // SizedBox(height: 30),
              //   // MaterialButton(
              //   //   onPressed: () {
              //   //     setState(() {
              //   //       message = 'Light Off';
              //   //     });
              //   //   },
              //   //   color: OffColour,
              //   //   elevation: 7.0,
              //   //   child: Text(
              //   //     'OFF',
              //   //     style: TextStyle(
              //   //       color: Colors.white,
              //   //     ),
              //   //   ),
              //   // ),
              //
              // ],

              children: Provider.of<Data>(context, listen: true).Switches,
            ),
          ),
        ),
      ),
    );
  }
}
