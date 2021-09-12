import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tier_faang/app_theme.dart';
import 'package:tier_faang/screens/design_course/design_course_app_theme.dart';
import 'package:tier_faang/screens/design_course/home_design_course.dart';

import 'register_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController =
      TextEditingController(text: 'example@email.com');

  TextEditingController passwordController =
      TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    // Widget welcomeBack = Text(
    //   'Welcome Back Dominac,',
    //   style: TextStyle(
    //       color: DesignCourseAppTheme.darkerText,
    //       fontSize: 34.0,
    //       fontWeight: FontWeight.bold,
    //       shadows: [
    //         BoxShadow(
    //           color: Color.fromRGBO(0, 0, 0, 0.15),
    //           offset: Offset(0, 5),
    //           blurRadius: 10.0,
    //         )
    //       ]),
    // );

    // Widget subTitle = Padding(
    //     padding: const EdgeInsets.only(right: 56.0),
    //     child: Text(
    //       'Login to your account using\nUsername or Email Address',
    //       style: TextStyle(
    //         color: DesignCourseAppTheme.darkerText,
    //         fontSize: 16.0,
    //       ),
    //     ));

    // Widget loginButton = Positioned(
    //   left: MediaQuery.of(context).size.width / 4,
    //   bottom: 40,
    //   child: InkWell(
    //     onTap: () async {
    //       await FirebaseAuth.instance.signInWithEmailAndPassword(
    //           email: emailController.text, password: passwordController.text);
    //       setState(() {
    //         if (!(user == null)) {
    //           Navigator.of(context).push(
    //               MaterialPageRoute(builder: (_) => DesignCourseHomeScreen()));
    //         }
    //       });
    //     },
    //     child: Container(
    //       width: MediaQuery.of(context).size.width / 3,
    //       height: 60,
    //       child: Center(
    //           child: new Text("Log In",
    //               style: const TextStyle(
    //                   color: const Color(0xfffefefe),
    //                   fontWeight: FontWeight.w600,
    //                   fontStyle: FontStyle.normal,
    //                   fontSize: 20.0))),
    //       decoration: BoxDecoration(
    //           color: DesignCourseAppTheme.darkerText,
    //           boxShadow: [
    //             BoxShadow(
    //               color: Color.fromRGBO(0, 0, 0, 0.16),
    //               offset: Offset(0, 5),
    //               blurRadius: 10.0,
    //             )
    //           ],
    //           borderRadius: BorderRadius.circular(9.0)),
    //     ),
    //   ),
    // );

    // Widget loginForm = Container(
    //   height: 240,
    //   child: Stack(
    //     children: <Widget>[
    //       Container(
    //         height: 160,
    //         width: MediaQuery.of(context).size.width,
    //         padding: const EdgeInsets.all(10),
    //         // decoration: BoxDecoration(
    //         //     color: Color.fromRGBO(255, 255, 255, 0.8),
    //         //     borderRadius: BorderRadius.only(
    //         //         topLeft: Radius.circular(10),
    //         //         bottomLeft: Radius.circular(10))),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             Padding(
    //               padding: const EdgeInsets.only(top: 8.0),
    //               child: TextField(
    //                 controller: emailController,
    //                 style: TextStyle(fontSize: 16.0),
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(top: 8.0),
    //               child: TextField(
    //                 controller: passwordController,
    //                 style: TextStyle(fontSize: 16.0),
    //                 obscureText: true,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       loginButton,
    //     ],
    //   ),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xffF5F3FD),
                // color: DesignCourseAppTheme.nearlyBlue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Text(
                    'Welcome Back Arduous people,',
                    style: TextStyle(
                        color: DesignCourseAppTheme.darkerText,
                        fontSize: 34.0,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            offset: Offset(0, 5),
                            blurRadius: 10.0,
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 56.0),
                      child: Text(
                        'Login to your account using\nUsername or Email Address',
                        style: TextStyle(
                          color: DesignCourseAppTheme.darkerText,
                          fontSize: 16.0,
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10),
                    // decoration: BoxDecoration(
                    //     color: Color.fromRGBO(255, 255, 255, 0.8),
                    //     borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(10),
                    //         bottomLeft: Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextField(
                            controller: emailController,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextField(
                            controller: passwordController,
                            style: TextStyle(fontSize: 16.0),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                        setState(() {
                          if (!(user == null)) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => HomeScreen()));
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: 50,
                        child: Center(
                            child: new Text("Log In",
                                style: const TextStyle(
                                    color: const Color(0xfffefefe),
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0))),
                        decoration: BoxDecoration(
                            color: DesignCourseAppTheme.darkerText,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.16),
                                offset: Offset(0, 5),
                                blurRadius: 10.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(9.0)),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Forgot your password? ',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: DesignCourseAppTheme.darkerText,
                            fontSize: 14.0,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Reset password',
                            style: TextStyle(
                              color: DesignCourseAppTheme.darkerText,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
