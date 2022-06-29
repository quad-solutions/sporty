import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporty_mc_sportface/models/settings.dart';

class SettingsView extends StatefulWidget{
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SettingsViewState();
}

class SettingsViewState extends State<SettingsView>{
  late TextEditingController _controller;

  @override
  void initState(){
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  void saveSettings(BuildContext context){
    Provider.of<Settings>(context, listen: false).setUserName(_controller.text);
    Navigator.pushNamed(context, "/dashboard");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to Sporty!"),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Please enter your name'
              ),
            ),
            ElevatedButton(
              onPressed: () {
                saveSettings(context);
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}