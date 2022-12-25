// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:palcmentor/Screen/home.dart';
import 'package:palcmentor/tabs_screen.dart';
import 'package:palcmentor/widgets/passwordreset.dart';
// import 'package:loginuicolors/register.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyLogin extends StatefulWidget {
  MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController inputEmail = TextEditingController();

  final TextEditingController inputPassword = TextEditingController();

  void submitData() {
    // final userList list<;
    if (inputEmail != null && inputPassword != null) {
      FirebaseFirestore.instance
          .collection('userDetails')
          .snapshots()
          .listen((event) {
        event.docs.forEach((element) {
          // userList
          // print(element['gmail']);
          // print(element['password']);
          // print(inputEmail);
          // print(inputPassword);
          // if (element['gmail'] == inputEmail) {
          //   if (element['password'] == inputPassword) {
          //     Navigator.push(ctx,
          //         MaterialPageRoute(builder: (context) => MyHomePage()));
          //   }
          // }
        });
      });
    }
  }

  Future SignIn() async {
    showDialog(
      context: context,
      builder: ((context) {
        return Container(
          width: double.maxFinite,
          height: 500,
          child: SpinKitWanderingCubes(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.red : Colors.green,
                ),
              );
            },
          ),
        );
      }),
    );
    setState(() {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: inputEmail.text.trim(),
              password: inputPassword.text.trim())
          .then((result) {
        var _uname;
        FirebaseFirestore.instance
            .collection('usersDetails')
            .snapshots()
            .listen((event) {
          event.docs.forEach((element) {
            if (element.id == result.user?.uid) {
              _uname = element.get('name');
            }
          });
        });
        return result.user?.updateDisplayName(_uname);
      });
      final user = FirebaseAuth.instance.currentUser;

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    });
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void openTransectionInputBar(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: ((bctx) {
        return GestureDetector(
          child: PasswordReset(),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login_back2.jpg'),
            fit: BoxFit.cover),
      ),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(101, 0, 0, 0),
              Color.fromARGB(229, 0, 0, 0)
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height * 0.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 35,
                    ),
                    child: Text(
                      'Welcome\nBack',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico',
                          color: Color.fromARGB(255, 248, 170, 3),
                          fontSize: MediaQuery.of(context).size.height * 0.04),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.2,
                        left: 35,
                        right: 35),
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              fillColor: Color.fromARGB(105, 245, 245, 245),
                              filled: true,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          controller: inputEmail,
                          onFieldSubmitted: (_) => SignIn(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        TextFormField(
                          style: TextStyle(),
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: Color.fromARGB(105, 245, 245, 245),
                              filled: true,
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          controller: inputPassword,
                          onFieldSubmitted: (_) => SignIn(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Sign in',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 248, 170, 3),
                                  fontFamily: 'Pacifico',
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xff4c505b),
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    SignIn();
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             MyHomePage()));
                                  },
                                  // {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               MyHomePage()));
                                  // },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  openTransectionInputBar(context);
                                },
                                child: const Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xff4c505b),
                                    fontSize: 18,
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
