import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text("Settings"),
          centerTitle: true,
          backgroundColor: Colors.grey.shade300,
        ),
        body: ListView(
          padding: EdgeInsets.all(25),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Switch Mode"),
                CupertinoSwitch(
                  value: true,
                  onChanged: (value) {
                    value = !value;
                  },
                ),
              ],
            )
          ],
        ));
  }
}
