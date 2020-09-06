import 'package:basic_utils/basic_utils.dart';
import 'package:firebase/event_details.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class User_DashboardPage extends StatefulWidget {
  final FirebaseUser currentPage;
  User_DashboardPage({@required this.currentPage});

  @override
  _User_DashboardPageState createState() => _User_DashboardPageState();
}

class _User_DashboardPageState extends State<User_DashboardPage> {
  final textstyle =TextStyle(fontFamily: 'Avenir', fontSize: 30, color: const Color(0xffffffff), fontWeight: FontWeight.w900,);
  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);


  Future getPost() async{
    var firestore =Firestore.instance;
    QuerySnapshot qn = await firestore.collection('data').getDocuments();
    return qn.documents;
  }





  navigateToDetail(DocumentSnapshot index){
    Navigator.push(context, MaterialPageRoute(
        builder: (context)  => DetailPage(index: index,)
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text('Events'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[



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

        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: FutureBuilder(
          future: getPost(),
          builder: (_, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{

              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 450,
                      padding: const EdgeInsets.only(left: 32),
                      child: Swiper(
                        itemCount: snapshot.data.length,
                        itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                        layout: SwiperLayout.STACK,
                        pagination: SwiperPagination(
                          builder:
                          DotSwiperPaginationBuilder(activeSize: 10, space: 8),
                        ),
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () => navigateToDetail(snapshot.data[index]),
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(height: 45),
                                    Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      color: Colors.white,
                                      child: Padding(
                                        padding: EdgeInsets.all(55.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: MediaQuery.of(context).size.height*0.08),
                                            Text(
                                              snapshot.data[index].data['name'],
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 25,
                                                color: const Color(0xff47455f),
                                                fontWeight: FontWeight.w900,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(height: 8,),
                                            Text(
                                              'by ' + snapshot.data[index].data['organiser'],
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 18,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(height: 8,),
                                            Text(
                                              snapshot.data[index].data['date'],
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 18,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(height: 32),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  'Read more',
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 18,
                                                    color: Colors.blueAccent,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.teal,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
