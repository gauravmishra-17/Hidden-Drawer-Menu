import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/simple_hidden_drawer.dart';
import 'package:ui_projext2/screens/screen2.dart';
import 'package:ui_projext2/screens/screen3.dart';
import 'screens/screen1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        body: SimpleHiddenDrawer(
          menu: Menu(),
          screenSelectedBuilder: (position, controller) {
            Widget screenCurrent;

            switch (position) {
              case 0:
                screenCurrent = Screen1();
                break;
              case 1:
                screenCurrent = Screen2();
                break;
              case 2:
                screenCurrent = Screen3();
                break;
            }

            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      controller.toggle();
                    }),
              ),
              body: screenCurrent,
            );
          },
        ),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  SimpleHiddenDrawerController controller;

  @override
  void didChangeDependencies() {
    controller = SimpleHiddenDrawerController.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 300,
        color: Colors.white10,
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.red[300]),
                child: CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: Colors.white60,
                    child: Text(
                      'G',
                      style: TextStyle(fontSize: 100),
                    )),
              ),
              ListTile(
                leading: Icon(Icons.people),
                onTap: () {
                  controller.setSelectedMenuPosition(0);
                },
                title: Text("People"),
              ),
              ListTile(
                leading: Icon(Icons.home),
                onTap: () {
                  controller.setSelectedMenuPosition(1);
                },
                title: Text("House"),
              ),
              ListTile(
                leading: Icon(Icons.pets),
                onTap: () {
                  controller.setSelectedMenuPosition(2);
                },
                title: Text("Pets"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
