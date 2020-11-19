import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  String groupname = '';
  String name = '';
  String value = '';

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
