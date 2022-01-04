import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/auth/Organizer_login.dart';
import 'package:flutter_app/auth/user_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrganizerSignUp extends StatefulWidget {
  @override
  _OrganizerSignUpState createState() => _OrganizerSignUpState();
}

class _OrganizerSignUpState extends State<OrganizerSignUp> {
  final formkey = new GlobalKey<FormState>();
  var username = '';
  var email = '';
  var phonenumber='';
  var cnic = '';
  var address = '';
  var password = '';
  var confirmPassword = '';
  var setvalue;
  List<String> gender = ['Male', 'Female'];
  String selected = '';
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phonenumberController = TextEditingController();
  final cnicController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final genderController = TextEditingController();
  final setvalueController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phonenumberController.dispose();
    cnicController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    genderController.dispose();
    setvalueController.dispose();
    super.dispose();
  }


  Future<User?> registration() async {
    if (password == confirmPassword) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email, password: password);
        await FirebaseFirestore.instance
            .collection('registration')
            .doc()
            .set({
          'Username': username,
          'Email': email,
          'Phone': phonenumber,
          'CNIC': cnic,
          'Adddress': address,
          'Gender': setvalue,
          'User':'Organizer'
        })
            .then((value) => print('User Added'))
            .catchError((error) => print('Falied to add user: $error'));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OrganizerLogin(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Password Provided is too weak',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Account already exists',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ));
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Password and Conform Password Does'nt match",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ));
    }
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      systemNavigationBarColor: Colors.black, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Register",
          style: TextStyle(
            fontSize: 45.0,
            fontFamily: "Lato-Bold",
            color: Colors.white,
          ),
        ),
      ),
      body: ClipRRect(
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(0.0),
          topRight: const Radius.circular(0.0),
        ),
        child: Container(
          height: 800.0,
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.fromLTRB(240,20,5, 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.supervised_user_circle_rounded,
                                color: Colors.deepPurpleAccent[100],
                              ),
                            SizedBox(width: 2.0),
                            Text('Organizer',
                            style: TextStyle(
                              fontSize: 18,fontWeight:FontWeight.w300,color: Colors.deepPurpleAccent[100]
                            ),),

                        ],
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Username',
                              icon: Icon(
                                FontAwesomeIcons.user,
                                color: Colors.deepPurpleAccent[100],
                              ),
                            ),
                            controller: usernameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Name';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Email',
                              errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                              icon: Icon(
                                FontAwesomeIcons.envelope,
                                color: Colors.deepPurpleAccent[100],
                              ),
                            ),
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email';
                              } else if (!value.contains('@')) {
                                return 'Please Enter Valid Email';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              icon: Icon(
                                FontAwesomeIcons.phone,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            controller: phonenumberController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Phone No.';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'CNIC',
                              icon: Icon(
                                FontAwesomeIcons.idCard,
                                color: Colors.deepPurpleAccent[100],
                              ),
                            ),
                            controller: cnicController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter CNIC';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          //width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'Address',
                                icon: Icon(
                                  FontAwesomeIcons.addressBook,
                                  color: Colors.deepPurpleAccent[100],
                                ),
                              ),
                              controller: addressController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Address';
                                }
                                return null;
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                              icon: Icon(
                                FontAwesomeIcons.lock,
                                color: Colors.deepPurpleAccent[100],
                              ),
                            ),
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                              icon: Icon(
                                FontAwesomeIcons.userLock,
                                color: Colors.deepPurpleAccent[100],
                              ),
                            ),
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Conform your Password';
                              }
                              return null;
                            }),
                      ),

                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(50.0,10.0,20,0),
                              child: DropdownButton(
                                hint: Text(
                                  'Select Gender',
                                  style: TextStyle(
                                    color: Colors.deepPurpleAccent[100],
                                  ),
                                ),
                                isExpanded: true,
                                iconSize: 40.0,
                                value: setvalue,
                                onChanged: (newValue) {
                                  setState(() {
                                    setvalue = newValue;
                                  });
                                },
                                items: gender.map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                              ),
                            ),

                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              selected,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.deepPurpleAccent[100],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ignore: deprecated_member_use
                      Container(
                        height: 40.0,
                        width: 320.0,
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.deepPurpleAccent[100],
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              setState(() {
                                username = usernameController.text;
                                email = emailController.text;
                                phonenumber = phonenumberController.text;
                                cnic = cnicController.text;
                                address = addressController.text;
                                password = passwordController.text;
                                confirmPassword = confirmPasswordController.text;



                                // addUser();
                              });
                              registration();
                            }
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Already Have an Accound? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrganizerLogin()));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.deepPurpleAccent[100],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}