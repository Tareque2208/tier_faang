import 'package:flutter/material.dart';
import 'package:tier_faang/components/custom_button.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size screen = MediaQuery.of(context).size;
    Map<String, dynamic> args = {};

    int time = DateTime.now().difference(args['start_at']).inSeconds;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: screen.width - 40.0,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(6.0, 12.0),
                      blurRadius: 6.0,
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: screen.width / 3.5,
                    width: screen.width / 3.5,
                    child: Image(
                      image: AssetImage((args['corrects'] >= 5)
                          ? 'assets/images/celebrate.png'
                          : 'assets/images/repeat.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      (args['corrects'] >= 5)
                          ? 'Congratulations!!'
                          : 'Completed!',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      (args['corrects'] >= 5)
                          ? 'You are amazing!!'
                          : 'Better luck next time!',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Text(
                    '${args['corrects']}/${args['list_length']} correct answers in $time seconds.',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'start');
                    },
                    child: CustomButton(
                      text: 'Play Again',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
