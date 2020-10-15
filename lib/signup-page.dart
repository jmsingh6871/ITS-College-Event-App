import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Container(
//          color: primaryColor,
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              Text(
                  "Register Yourself \n with your college domain EmailId",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.chilanka(
                    fontWeight: FontWeight.w100,
                    fontSize: 30.0,
                    color: Colors.white,
                  )
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.90,
                child: Column(
                  children: [
                    _buildTextField(false,"Username"," ",Icons.person),
                    SizedBox(height: MediaQuery.of(context).size.height*0.03),
                    _buildTextField(false,"Phone Number"," ",Icons.phone),
                    SizedBox(height: MediaQuery.of(context).size.height*0.03),
                    _buildTextField(false,"Email id","abc@its.edu.in ",Icons.mail),
                    SizedBox(height: MediaQuery.of(context).size.height*0.03),
                    _buildTextField(true,"Password"," ",Icons.lock),
                    SizedBox(height: MediaQuery.of(context).size.height*0.03),
                    _buildTextField(true,"Re-Enter Password"," ",Icons.lock),
                    SizedBox(height: MediaQuery.of(context).size.height*0.03),
                  ],
                ),
              ),
              Container(

                child: Column(
                  children: [
                    MaterialButton(
                      minWidth: double.maxFinite,
                      height: MediaQuery.of(context).size.height*0.05,
                      color: logoGreen,
                      child: Text("Register", style: GoogleFonts.montserrat(color: Colors.white),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildTextField(txtPass, String label,String hint,IconData iconUsed){
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        border: Border.all(color: Colors.blue,)
      ),
      child: TextField(
        obscureText: txtPass,

        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            labelText: label,
            hintText: hint,
            hintStyle: GoogleFonts.chilanka(fontSize: 10.0, color: Colors.white, ),
            labelStyle: TextStyle(color: Colors.white),
            icon: Icon(
              iconUsed,
              color: Colors.white,
            ),
          border: InputBorder.none
        ),
      ),
    );
  }
}