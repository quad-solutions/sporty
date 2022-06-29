import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporty_mc_sportface/models/settings.dart';

class Dashboard extends StatelessWidget{

  const Dashboard({super.key});

  final String title = "Dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(title)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet(
          context: context,
          builder: (builder) {
            return Container(
              padding: const EdgeInsets.all(5.0),
              child: Wrap(
                children: [
                  getListTile(Icons.fast_forward, Colors.black, "Continue Session", context),
                  const Divider(
                    height: 5.0,
                    color: Colors.black,
                  ),
                  getListTile(Icons.play_arrow, Colors.black, "Start: LAST TRAINING COMPILATION", context),
                  getListTile(Icons.list, Colors.black, "Select Training", context),
                  getListTile(Icons.sports_gymnastics, Colors.black, "Start: Freestyle", context),
                ],
              ),
            );
          }
          )
        },
        child: const Icon(
            Icons.play_arrow
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.burst_mode), label: "Trainings")
        ],
        onTap: (index) {
          switch(index){
            case 0:
              Navigator.pushNamed(context, "/settings");
          }
        },
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<Settings>(
                            builder: (context, settings, child) => Text("Welcome ${settings.userName}!", style: Theme.of(context).textTheme.headlineMedium),
                          ),
                          Text("Your last training was on DATE", style: Theme.of(context).textTheme.headlineSmall,)
                        ],
                      ),
                    )
                  )
              )
            ],

          ),
          Row(
            children: const [
              Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Here is a graph bar"),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}


ListTile getListTile(icon, iconColor, titleText, context){
  return ListTile(
    leading: SizedBox(
      width: 4.0,
      child: Icon(
        icon,
        color: iconColor,
        size: 24.0,
      ),
    ),
    title: Text(
      titleText,
      style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w700
      ),
    ),
    onTap: () => Navigator.of(context).pop(),
  );
}