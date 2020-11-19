import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'task_data.dart';
import 'package:provider/provider.dart';

// bool stat = false;

class Switchs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      value: Provider.of<Data>(context, listen: false).status1,
      onToggle: (val) {
        Provider.of<Data>(context, listen: false).changStat(val);
      },
      activeColor: Colors.red,
      inactiveColor: Colors.red[200],
      toggleColor: Colors.blueGrey[700],
    );
  }
}
