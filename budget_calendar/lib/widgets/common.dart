import 'package:flutter/material.dart';
import '../styles.dart';

class Common {
  static AppBar headBar() {
    return AppBar(
      backgroundColor: Colors.red,
      title: Text('CaLeNdOoM', style: Styles.headerLarge),
      leading: Builder(
          builder: (BuildContext context) {
            return BackButton();
          })
    );
  }
}