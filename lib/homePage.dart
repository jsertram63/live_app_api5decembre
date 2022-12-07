import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Boardgames"),
    ),
    body: Center(child: Text("Content de mon app",style: TextStyle(
      fontSize: 20,
      color: Colors.red
    ),)),
    );
  }
}