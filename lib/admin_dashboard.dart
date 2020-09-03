import 'package:firebase/services/addevent.dart';
import 'package:firebase/user_dashboard.dart';
import 'package:firebase/admin_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class Admin_DashboardPage extends StatefulWidget {
  @override
  _Admin_DashboardPageState createState() => _Admin_DashboardPageState();
}

class _Admin_DashboardPageState extends State<Admin_DashboardPage> {

  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text('Admin Dashboard'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
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
                          new User_DashboardPage()));
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
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: MaterialButton(
                    child: Text('Add Event',style: TextStyle(color: Colors.white, fontSize: 16),),
                    elevation: 0,
                    minWidth: 30.0,
                    height: 50,

                    color: logoGreen,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) => addevent()
                      ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
