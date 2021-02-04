import 'package:expense_tracker/Animation/TransactionRouteAnimation.dart';
import 'package:expense_tracker/Screens/CashScreen.dart';
import 'package:expense_tracker/Screens/TransactionScreen.dart';
import 'package:flutter/material.dart';

import 'Models/Choice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.amberAccent,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: tabchoices.length,
        child: Scaffold(
          extendBody: true,
          appBar: _appbar(),
          drawer: _dashboardDrawer(),
          body: Stack(
            children: [
              TabBarView(children: [CashScreen(), CashScreen(), CashScreen()]),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amberAccent,
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  TransactionRouteAnimation(widget: TransactionScreen()),
                );
              });
            },
            child: Container(
              margin: EdgeInsets.all(15.0),
              child: Icon(Icons.add),
            ),
            elevation: 4.0,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 50,
              margin: EdgeInsets.only(left: 12.0, right: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    //update the bottom app bar view each time an item is clicked
                    onPressed: () {},
                    iconSize: 27.0,
                    icon: Icon(
                      Icons.home,
                    ),
                  ),
                  //to leave space in between the bottom app bar items and below the FAB
                  SizedBox(
                    width: 50.0,
                  ),
                  IconButton(
                    onPressed: () {},
                    iconSize: 27.0,
                    icon: Icon(
                      Icons.call_received,
                    ),
                  ),
                ],
              ),
            ),
            //to add a space between the FAB and BottomAppBar
            shape: CircularNotchedRectangle(),
            //color of the BottomAppBar
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _dashboardDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _appbar() {
    return AppBar(
      title: const Text(
        'Hello, Shai!',
      ),
      bottom: TabBar(
        indicatorColor: Colors.white,
        isScrollable: false,
        tabs: tabchoices.map((Choice choice) {
          return Tab(
            text: choice.title,
          );
        }).toList(),
      ),
      iconTheme: new IconThemeData(color: Colors.white),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
