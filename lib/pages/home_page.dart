import 'package:flutter/material.dart';
import 'package:flutter_template/languages/abstract_language.dart';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home Page")),
        drawer: drawerMethod(context),
        body: Center(
          child: Text(Languages.of(context).welcome_flutter_template),
        ));
  }
}
