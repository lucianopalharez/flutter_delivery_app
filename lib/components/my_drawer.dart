import 'package:flutter/material.dart';
import 'package:flutter_food/components/my_drawer_tile.dart';
import 'package:flutter_food/pages/settings_page.dart';
import 'package:flutter_food/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Icon(Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(padding: const EdgeInsets.all(25),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),  
          ), 
          MyDrawerTile(text: "H O M E", icon: Icons.home, onTap: () => 
            Navigator.pop(context)
          ,),

          MyDrawerTile(text: "S E T T I N G S", icon: Icons.settings, onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),));
          }),

          const Spacer(),

          MyDrawerTile(text: "L O G O U T", icon: Icons.logout, onTap: () {
            final authService = AuthService();
            authService.signOut();
          },),

          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}