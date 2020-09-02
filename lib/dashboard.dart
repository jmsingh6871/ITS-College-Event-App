import 'package:firebase/ITS_main.dart';
import 'package:firebase/admin_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';



class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text('Nitesh Nagpal'),
                accountEmail: new Text('niteshnagpal190@.com'),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
                ),
              ),
              new ListTile(
                title: new Text('Allusers Page'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                          new WelcomePage()));
                },
              ),
              new ListTile(
                title: new Text('Admins only'),
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => AdminPage()));
                  // pop();
                  // userObj.authorizeAdmin(context);
                },
              ),
              new ListTile(
                title: new Text('Logout', style: TextStyle(color: Colors.red)),

                onTap: () {
                 // Navigator.of(context).pop();
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  // Navigator.push(context,
                  // MaterialPageRoute(builder: (BuildContext context) =>LoginPage()));
                    // Navigator.of(context).pop();
                    // userObj.signOut();
                  // });
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Text('All Users Dashboard'),
        ));
  }
}
