import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tier_faang/screens/design_course/design_course_app_theme.dart';

import 'confirm_otp_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController phoneNumber = TextEditingController(text: '46834683');

  GlobalKey prefixKey = GlobalKey();
  double prefixWidth = 0;

  Widget prefix() {
    return Container(
        key: prefixKey,
        //padding: EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 12.0),
        margin: EdgeInsets.only(right: 4.0),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black, width: 0.5))),
        child: Text("something"));
  }

  @override
  Widget build(BuildContext context) {
    Widget background = Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
      // ),
      foregroundDecoration: BoxDecoration(color: Colors.red),
    );

    Widget title = Text(
      'Forgot your Password?',
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
          'Enter your registered mobile number to get the OTP',
          style: TextStyle(
            color: DesignCourseAppTheme.darkerText,
            fontSize: 16.0,
          ),
        ));

    Widget sendButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      bottom: 40,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => ConfirmOtpPage()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: 60,
          child: Center(
              child: new Text("Send OTP",
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

    Widget phoneForm = Container(
      height: 210,
      child: Stack(
        children: <Widget>[
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32.0, right: 12.0, bottom: 30),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                prefix(),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      controller: phoneNumber,
                      style: TextStyle(fontSize: 16.0),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ),
              ],
            ),
          ),
          sendButton,
        ],
      ),
    );

    Widget resendAgainText = Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Didn't receive the OPT? ",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: DesignCourseAppTheme.darkerText,
                fontSize: 14.0,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'Resend again',
                style: TextStyle(
                  color: DesignCourseAppTheme.darkerText,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ));
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
                phoneForm,
                Spacer(flex: 2),
                resendAgainText
              ],
            ),
          ),
          Positioned(
            top: 35,
            left: 5,
            child: IconButton(
              color: DesignCourseAppTheme.darkerText,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
