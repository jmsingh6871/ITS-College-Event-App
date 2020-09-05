
import 'package:firebase/user_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../admin_page.dart';

class addevent extends StatefulWidget {
  @override
  _addeventState createState() => _addeventState();
}

class _addeventState extends State<addevent> {

  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  TextEditingController ename = TextEditingController();
  TextEditingController edes = TextEditingController();
  TextEditingController edate = TextEditingController();
  TextEditingController elink = TextEditingController();
  TextEditingController eorg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text('Add Event',
          textAlign: TextAlign.center,
          style: GoogleFonts.openSans(color: Colors.white, fontSize: 28),),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
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
                         User_DashboardPage()));
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
      body: Builder(builder: (context) =>

     //////////////////////////BUILDER is used to show SNACKBAR//////////////

          Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Text('Add Event',
              //   textAlign: TextAlign.center,
              //   style: GoogleFonts.openSans(color: Colors.white, fontSize: 28),
              // ),
              SizedBox(height: 20.0,),
              Text('Enter the details of event',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(color: Colors.white, fontSize: 14),
              ),
              SizedBox(height: 30.0,),
              buildTextField(ename, "Event_Name", Icons.event,null),
              SizedBox(height: 30),
              buildTextField(edate, "Date", Icons.date_range,'dd/mm/yy'),
              SizedBox(height: 30),
              buildTextField(edes, "Description", Icons.description,null),
              SizedBox(height: 30),
              buildTextField(elink, "Link", Icons.link,null),
              SizedBox(height: 30),
              buildTextField(eorg, "Organiser", Icons.people,null),
              SizedBox(height: 30),
              MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: () async{
                  Map<String,dynamic> eventdata ={
                    'name' : ename.text,
                    'date' : edate.text,
                    'description' : edes.text,
                    'link' : elink.text,
                    'organiser': eorg.text
                  };

                  CollectionReference collectionRefernce = Firestore.instance.collection('data');
                  collectionRefernce.add(eventdata);
                  SnackBar actiondone = SnackBar(content: Text('Event uploaded'),);
                  Scaffold.of(context).showSnackBar(actiondone);
                },
                color: logoGreen,
                child: Text('Add Event',
                  style: TextStyle(color: Colors.white,fontSize: 16),
                ),
                textColor: Colors.white,
              ),
              SizedBox(height: 20.0,),
              MaterialButton(onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('Back',style: TextStyle(color: Colors.white,fontSize: 16),),
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                color: logoGreen,
              )
            ],
          ),
        ),
      ),
    ),
    );
  }


  buildTextField(TextEditingController controller, String labelText,
      IconData icon,txtpass) {
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(color: Colors.blue,)),
      child: TextField(
        obscureText: false,
        controller: controller,
        style: TextStyle(color: Colors.white,),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            labelText: labelText,
            hintText: txtpass,
            labelStyle: TextStyle(color: Colors.white),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            border: InputBorder.none
        ),

      ),

    );
  }
}