import 'package:flutter/material.dart';

import 'package:chit_chat/services/auth/auth_service.dart';
import 'package:chit_chat/screens/settings_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout (){
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  dividerTheme: const DividerThemeData(
                    color: Colors.transparent,
                  ),
                ),
                child: DrawerHeader(
                  child: Icon(
                    Icons.chat,
                    color: Theme.of(context).colorScheme.primary,
                    size: 60,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: ListTile(
                  title: const Text("HOME"),
                  leading: const Icon(Icons.home_rounded),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text("SETTINGS"),
                  leading: const Icon(Icons.settings_rounded),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              title: const Text("LOGOUT"),
              leading: const Icon(Icons.logout_rounded),
              onTap: logout,
            ),
          )
        ],
      ),
    );
  }
}
