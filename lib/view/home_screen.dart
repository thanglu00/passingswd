import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermessage/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:fluttermessage/view/generate_qr_screen.dart';
import 'package:fluttermessage/view/qrcode.dart';
import 'package:fluttermessage/view/recharge_money.dart';
import 'package:fluttermessage/view/userPage.dart';

import 'history_transaction.dart';

class HomeScreen extends StatefulWidget {
  final String name;

  HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int currentTabIndex = 0;
  String titleAppbar;

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  List<Widget> tabs = [
    UserPage(),
    RechargeMoney(),
    GenerateScreen(),
    History_View(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                AuthenticationLoggedOut(),
              );
            },
          )
        ],
      ),
      body: tabs[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          onTap: onTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text("Nap Tien")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Thanh Toan")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Lich su"))
          ]),
    );
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          Center(child: Text('Welcome $name!')),
//          Padding(
//            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//            child: RaisedButton(
//                color: Colors.blue,
//                textColor: Colors.white,
//                splashColor: Colors.blueGrey,
//                onPressed: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => GenerateScreen()),
//                  );
//                },
//                child: const Text('GENERATE QR CODE')
//            ),
//          ),
//        ],
//      ),
//    );
  }
}