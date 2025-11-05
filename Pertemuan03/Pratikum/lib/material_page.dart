import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 118, 177),
        title: Text("Home page"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: Text("Home")),
            ListTile(title: Text("profile")),
          ],
        ),
      ),
      body: Center(child: Text("Welcome to Home page")),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.indigoAccent,
      ),
    );
  }
}
