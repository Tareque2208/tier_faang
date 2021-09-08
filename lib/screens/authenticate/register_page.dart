import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tier_faang/screens/authenticate/welcome_back_page.dart';
import 'package:tier_faang/screens/design_course/design_course_app_theme.dart';

import 'forgot_password_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController =
      TextEditingController(text: 'example@email.com');
  TextEditingController usernameController =
      TextEditingController(text: 'username');

  TextEditingController passwordController =
      TextEditingController(text: '12345678');

  TextEditingController cmfPasswordController =
      TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      'Glad To Meet You,',
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
    );

    Widget subTitle = Padding(
        padding: const EdgeInsets.only(right: 56.0),
        child: Text(
          'Create your new account',
          style: TextStyle(
            color: DesignCourseAppTheme.darkerText,
            fontSize: 16.0,
          ),
        ));

    Widget registerButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      bottom: 40,
      child: InkWell(
        onTap: () async {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
          setState(() {});
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (_) => ForgotPasswordPage()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: 60,
          child: Center(
              child: new Text("Register",
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
    );

    Widget registerForm = Container(
      height: 350,
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 250,
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
                      controller: usernameController,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      controller: cmfPasswordController,
                      style: TextStyle(fontSize: 16.0),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
            ),
            registerButton,
          ],
        ),
      ),
    );

    Widget socialRegister = Column(
      children: <Widget>[
        Text(
          'You can sign in with',
          style: TextStyle(
              fontSize: 12.0,
              fontStyle: FontStyle.italic,
              color: DesignCourseAppTheme.darkerText),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.find_replace),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => WelcomeBackPage()));
              },
              color: DesignCourseAppTheme.darkerText,
            ),
            IconButton(
                icon: Icon(Icons.find_replace),
                onPressed: () {},
                color: DesignCourseAppTheme.darkerText),
          ],
        )
      ],
    );

    return Scaffold(
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
                Spacer(flex: 3),
                title,
                Spacer(),
                subTitle,
                Spacer(flex: 2),
                registerForm,
                Spacer(flex: 2),
                Padding(
                    padding: EdgeInsets.only(bottom: 20), child: socialRegister)
              ],
            ),
          ),
          // Positioned(
          //   top: 35,
          //   left: 5,
          //   child: IconButton(
          //     color: DesignCourseAppTheme.darkerText,
          //     icon: Icon(Icons.arrow_back),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
