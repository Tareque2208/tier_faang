import 'package:flutter/material.dart';
import 'package:tier_faang/screens/authenticate/sign_in.dart';
import 'package:tier_faang/screens/authenticate/welcome_back_page.dart';
import 'package:tier_faang/screens/design_course/home_design_course.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WelcomeBackPage(),
      // child: DesignCourseHomeScreen(),
    );
  }
}
