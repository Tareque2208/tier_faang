import 'package:tier_faang/components/determination_view.dart';
import 'package:tier_faang/components/center_next_button.dart';
import 'package:tier_faang/components/planning_review_vew.dart';
import 'package:tier_faang/components/focus_view.dart';
import 'package:tier_faang/components/clearhead_view.dart';
import 'package:tier_faang/components/top_back_skip_view.dart';
import 'package:tier_faang/components/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:tier_faang/screens/authenticate/register_page.dart';

class IntroductionAnimationScreen extends StatefulWidget {
  const IntroductionAnimationScreen({Key? key}) : super(key: key);

  @override
  _IntroductionAnimationScreenState createState() =>
      _IntroductionAnimationScreenState();
}

class _IntroductionAnimationScreenState
    extends State<IntroductionAnimationScreen> with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 6));
    _animationController?.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_animationController?.value);
    return Scaffold(
      backgroundColor: Color(0xffF5F3FD),
      body: ClipRect(
        child: Stack(
          children: [
            ClearHeadView(
              animationController: _animationController!,
            ),
            FocusView(
              animationController: _animationController!,
            ),
            DeterminationView(
              animationController: _animationController!,
            ),
            PlanningReviewVew(
              animationController: _animationController!,
            ),
            WelcomeView(
              animationController: _animationController!,
            ),
            TopBackSkipView(
              onBackClick: _onBackClick,
              onSkipClick: _onSkipClick,
              animationController: _animationController!,
            ),
            CenterNextButton(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.8, duration: Duration(milliseconds: 300));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _signUpClick();
    }
  }

  void _signUpClick() {
    //Testing snackbar
    // final snackBar = SnackBar(
    //   content: Text('Yay! A SnackBar!'),
    //   action: SnackBarAction(
    //     label: 'Undo',
    //     onPressed: () {
    //       // Some code to undo the change.
    //     },
    //   ),
    // );
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);

    //Navigating to wrapper class.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
    // Navigator.pop(context);
  }
}
