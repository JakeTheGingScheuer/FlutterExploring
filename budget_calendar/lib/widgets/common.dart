import 'package:flutter/material.dart';
import '../styles.dart';

class Common {
  static AppBar headBar(String title) {
    return AppBar(
      backgroundColor: Colors.red,
      title: Text(title, style: Styles.headerLarge),
      leading: Builder(
          builder: (BuildContext context) {
            if(Navigator.canPop(context)) {
              return BackButton();
            }else return Container();
          })
    );
  }
}