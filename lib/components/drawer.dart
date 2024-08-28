import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth/auth_service.dart';
import 'package:flutter_application_1/pages/settings.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  final authService = AuthService();
  void logout() async {
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.grey.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const DrawerHeader(
                  child: Center(
                    child: Icon(
                      Icons.message,
                      size: 64,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    title: Text("HOME"),
                    leading: Icon(Icons.home),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    title: Text("SETTINGS"),
                    leading: Icon(Icons.settings),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                title: Text("LOGOUT"),
                leading: Icon(Icons.logout),
                onTap: logout,
              ),
            )
          ],
        ));
  }
}
