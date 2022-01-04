import 'package:flutter_app/Screen/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  _ForgetState createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  @override
  final _formkey = GlobalKey<FormState>();
  var email = "";
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orangeAccent,
        content: Text(
          'Password has been sent to your Email',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'No User found for that Email',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ));
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[200],
        elevation: 8.0,
        centerTitle: true,
        title: Text(
          "Reset your password",
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: "Lato-BoldItalic",
            fontWeight:FontWeight.bold,

          ),
        ),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.reply,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text(
              'Reset Link will be sent by your Email ',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight:FontWeight.w700,
              ),
            ),
          ),
        ),
        Expanded(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: ListView(children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Email ID',
                      errorStyle: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 15.0,
                      ),
                    ),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter the Email';
                      } else if (!value.contains('@')) {
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 80.0, right: 80, top: 20),
                  child: FlatButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          email = emailController.text;
                        });
                        resetPassword();
                      }
                    },
                    color: Colors.redAccent[200],
                    child: Text(
                      "Send Email",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(100.0)),
                    height: 40.0,
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Already Have an Account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OpenWelcomeScreen()));
                          },
                          child: Text(
                            "Click Here",
                            style: TextStyle(
                              color: Colors.redAccent[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ]),
    );
  }
}