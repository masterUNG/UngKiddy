import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            showHead(),
            homeMenu(),
            infoMenu(),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home'),
      ),
    );
  }

  ListTile homeMenu() => ListTile(
        leading: Icon(
          Icons.account_balance,
          size: 36.0,
          color: Colors.purple.shade800,
        ),
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
      );

  ListTile infoMenu() => ListTile(
        leading: Icon(
          Icons.info,
          size: 36.0,
          color: Colors.amber.shade800,
        ),
        title: Text(
          'ราละเอียด',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
      );

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Image2.png'), fit: BoxFit.cover)),
        accountName: Text('Guest'),
        accountEmail: Text('Login'));
  }
}
