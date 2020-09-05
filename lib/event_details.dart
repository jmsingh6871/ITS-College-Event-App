import 'package:flutter/material.dart';
import 'data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailPage extends StatefulWidget {
  final DocumentSnapshot index;

  DetailPage({this.index});



  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future getPost() async{
    var firestore =Firestore.instance;
    QuerySnapshot qn = await firestore.collection('data').getDocuments();
    return qn.documents;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: getPost(),
          // ignore: missing_return
          builder: ( _, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{
              return SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[

                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                                  Text(
                                    widget.index.data['name'],
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 56,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    widget.index.data['organiser'],
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 31,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Divider(color: Colors.black38),
                                  SizedBox(height: 32),
                                  Text(
                                    widget.index.data['description'],
                                    maxLines: 999,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 20,
                                      color: Colors.teal,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 32),
                                  Divider(color: Colors.black38),

                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 32.0),
                            //   child: Text(
                            //     'Gallery',
                            //     style: TextStyle(
                            //       fontFamily: 'Avenir',
                            //       fontSize: 25,
                            //       color: const Color(0xff47455f),
                            //       fontWeight: FontWeight.w300,
                            //     ),
                            //     textAlign: TextAlign.left,
                            //   ),
                            // ),
                            Container(
                              height: 60,

                              padding: const EdgeInsets.only(bottom:15.0),
                              child: Center(

                                child: MaterialButton(
                                  height: 45,
                                  minWidth: 25,
                                  child: Text('Register',
                                    style: TextStyle(color: Colors.white,fontSize: 16),
                                  ),
                                  color: Color(0xff25bcbb),
                                  onPressed: (){
                                    String url = widget.index.data['link'];
                                    launch(url);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),

                      ),
// Positioned(
//   right: -55,
//   height: 300,
//   child: Hero(
//       tag: planetInfo.position,
//       child: Image.asset(planetInfo.iconImage)),
// ),
// Positioned(
//   top: 60,
//   left: 32,
//   child: Text(
//     planetInfo.position.toString(),
//     style: TextStyle(
//       fontFamily: 'Avenir',
//       fontSize: 235,
//       color: Colors.black.withOpacity(0.08),
//       fontWeight: FontWeight.w900,
//     ),
//     textAlign: TextAlign.left,
//   ),
// ),
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),


                    ],
                  ),
                ),
              );
            }
          }

        )
      ),
    );
  }
}
