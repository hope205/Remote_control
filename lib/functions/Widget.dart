import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'task_data.dart';
import 'package:provider/provider.dart';

class Switchs extends StatelessWidget {
  final String name;

  Switchs({@required this.name});
  @override
  Widget build(BuildContext context) {
    bool stat = Provider.of<Data>(context, listen: true).SwitchState(name);

    return FlutterSwitch(
      value: stat,
      onToggle: (val) {
        Provider.of<Data>(context, listen: false).changStatus(val, name);
      },
      activeColor: Colors.red,
      inactiveColor: Colors.red[200],
      toggleColor: Colors.blueGrey[700],
    );
  }
}

class Content extends StatelessWidget {
  final String item;
  final String name;
  Content({this.item, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(item),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                // Switchs(name: itemName),
                GestureDetector(
              child: Switchs(name: item),
              onLongPress: () async {
                await Provider.of<Data>(context, listen: false)
                    .DeleteSwitch(item, name);
              },
            ),
          ),
        ],
      ),
    );
  }
}
