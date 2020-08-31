import 'package:firebase/ITS_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';


import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  final  TextEditingController nameController = TextEditingController();
  final  TextEditingController passwordController = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sign in to ITS Mohan Nagar',
                textAlign: TextAlign.center,
                style:
                GoogleFonts.openSans(color: Colors.white, fontSize: 28),
              ),
              SizedBox(height: 20),
              Text(
                'Enter your email and password below to continue participating in the latest events.',
                textAlign: TextAlign.center,
                style:
                GoogleFonts.openSans(color: Colors.white, fontSize: 14),
              ),
              SizedBox(height: 50,),
              buildTextField( nameController, "Email", Icons.account_circle),
              SizedBox(height: 30),
              buildTextField( passwordController, "Password", Icons.lock),
              SizedBox(height: 30),


              MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: () async {
                  print(nameController.text);
                  FirebaseUser firebaseUser;
                  firebaseAuth.signInWithEmailAndPassword(
                      email: nameController.text, password: passwordController.text).then((
                      authResult) {
                    setState(() {
                      firebaseUser = authResult.user;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
                    });
                  });
                  print(firebaseUser.email);
                },

                color: logoGreen,
                child: Text('Login',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                textColor: Colors.white,

              ),
              SizedBox(height: 20),
              MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: () async {
                  //Here goes the logic for Google SignIn discussed in the next section
                  final GoogleSignInAccount googleUser = await googleSignIn
                      .signIn();
                  final GoogleSignInAuthentication googleAuth =
                  await googleUser.authentication;

                  final AuthCredential credential = GoogleAuthProvider
                      .getCredential(
                      idToken: googleAuth.idToken,
                      accessToken: googleAuth.accessToken);

                  final FirebaseUser user = (await firebaseAuth
                      .signInWithCredential(credential)).user;
                },
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.google),
                    SizedBox(width: 10),
                    Text('Sign-in using Google',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
                textColor: Colors.white,
              ),
              SizedBox(height: 80),
              _buildFooterLogo(),

            ],
          ),
        ),
      ),
    );
  }


  _buildFooterLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
//        Image.asset(
//          'assets/tgd_white.png',
//          height: 40,
//        ),
        Text('Develop by \n Neha Aggarwal',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 16,
              //fontWeight: FontWeight.bold
            )),
      ],
    );
  }


  buildTextField( TextEditingController controller, String labelText, IconData icon) {
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(color: Colors.blue,)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white,),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            labelText: labelText,
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

