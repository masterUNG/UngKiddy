import 'package:flutter/material.dart';
import 'package:ungkiddy/widget/information.dart';
import 'package:ungkiddy/widget/list_product.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit
  Widget currentWidget;
  String title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currentWidget = ListProduct();
    title = 'List Product';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentWidget,
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
        title: Text(title),
      ),
    );
  }

  ListTile homeMenu() => ListTile(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            currentWidget = ListProduct();
            title = 'List Product';
          });
        },
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
        onTap: () {
          Navigator.pop(context);
          setState(() {
            currentWidget = Information();
            title = 'Information';
          });
        },
        leading: Icon(
          Icons.info,
          size: 36.0,
          color: Colors.amber.shade800,
        ),
        title: Text(
          'รายละเอียด',
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
