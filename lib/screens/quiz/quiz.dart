import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html_unescape/html_unescape.dart';
import 'package:tier_faang/components/quiz_option.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late List? questions;
  late String? currentTitle;
  late String? currentCorrectAnswer;
  late List<dynamic>? currentAnswers;
  late int corrects;
  late int currentQuestion;
  late int selectedAnswer;
  late DateTime now;

  @override
  void initState() {
    this.now = DateTime.now();
    this.corrects = 0;
    this.currentQuestion = 0;
    this.questions = null;
    this.selectedAnswer = 0;
    this.getQuestions();
    super.initState();
  }

  void getQuestions() async {
    final response = await http
        .get(Uri.parse('https://opentdb.com/api.php?amount=10&category=18'));
    Map data = json.decode(response.body);
    print(data);
    List answers = [data['results'][0]['correct_answer']] +
        data['results'][0]['incorrect_answers'];
    setState(() {
      this.questions = data['results'];
      this.currentTitle = data['results'][0]['question'];
      this.currentCorrectAnswer = data['results'][0]['correct_answer'];
      this.currentAnswers = answers..shuffle();
    });
  }

  void verifyAndNext(BuildContext context) {
    String textSelectAnswer = this.currentAnswers![this.selectedAnswer];
    if (textSelectAnswer == this.currentCorrectAnswer) {
      setState(() {
        this.corrects++;
      });
    }
    this.nextQuestion(context);
  }

  void nextQuestion(BuildContext context) {
    int actualQuestion = this.currentQuestion;
    if (actualQuestion + 1 < this.questions!.length) {
      List answers = [this.questions![actualQuestion + 1]['correct_answer']] +
          this.questions![actualQuestion + 1]['incorrect_answers'];
      setState(() {
        this.currentQuestion++;
        this.currentTitle = this.questions![actualQuestion + 1]['question'];
        this.currentCorrectAnswer =
            this.questions![actualQuestion + 1]['correct_answer'];
        this.currentAnswers = answers..shuffle();
        this.selectedAnswer = 0;
      });
    } else {
      Navigator.pushReplacementNamed(context, 'result', arguments: {
        'corrects': this.corrects,
        'start_at': this.now,
        'list_length': this.questions!.length,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: (this.questions != null)
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, 'start');
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 32.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Question ${this.currentQuestion + 1}',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '/${this.questions!.length}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(25.0),
                      margin: const EdgeInsets.symmetric(vertical: 30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Question',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: this.currentAnswers!.length + 1,
                        itemBuilder: (context, index) {
                          if (index == this.currentAnswers!.length) {
                            return GestureDetector(
                              onTap: () {
                                if (this.selectedAnswer != null)
                                  this.verifyAndNext(context);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 30.0,
                                ),
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  color: (this.selectedAnswer == null)
                                      ? Colors.grey
                                      : theme.primaryColor,
                                  borderRadius: BorderRadius.circular(180.0),
                                ),
                                child: Text(
                                  'Next',
                                  textAlign: TextAlign.center,
                                  maxLines: 5,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            );
                          }
                          String answer = this.currentAnswers![index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                this.selectedAnswer = index;
                              });
                            },
                            child: QuizOption(
                              index: index,
                              selectedAnswer: this.selectedAnswer,
                              answer: answer,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    theme.primaryColor,
                  ),
                ),
              ),
      ),
    );
  }
}
