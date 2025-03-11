import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: const Text('Alvin'),
              accountEmail: const Text('alvin@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
    child: Image.network('ff.png'),
    ),
          ),

      ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text('home'),
          ),

          const ListTile(
            leading: Icon(Icons.people),
            title: Text('people'),
          ),

          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),

          const ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
          ),

          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
          ),

          const ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
          ),

          const ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
