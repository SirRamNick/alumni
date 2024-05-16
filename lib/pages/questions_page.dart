import 'package:alumni_app/compontents/button.dart';
import 'package:alumni_app/compontents/question_form.dart';
import 'package:alumni_app/pages/navigation_page.dart';
import 'package:alumni_app/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsPage extends StatefulWidget {
  final String docID;
  const QuestionsPage({
    super.key,
    required this.docID,
  });

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  late final FirestoreService alumni = FirestoreService();

  final List _firstQuestion = [
    {'value': false, 'answer': 'yes'},
    {'value': false, 'answer': 'no'},
  ];

  final List _secondQuestion = [
    {'value': false, 'answer': 'Not relevant at all'},
    {'value': false, 'answer': 'Somewhat relevant'},
    {'value': false, 'answer': 'Very relevant'},
  ];

  final List _thirdQuestion = [
    {'value': false, 'answer': 'Not helpful at all'},
    {'value': false, 'answer': 'Somewhat helpful'},
    {'value': false, 'answer': 'Very helpful'},
  ];

  final List _fourthQuestion = [
    {'value': false, 'answer': 'No'},
    {'value': false, 'answer': 'Somehow'},
    {'value': false, 'answer': 'Yes'},
  ];

  final List _fifthQuestion = [
    {'value': false, 'answer': 'Not relevant at all'},
    {'value': false, 'answer': 'Somewhat relevant'},
    {'value': false, 'answer': 'Same/very relevant'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE2E2E2),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('OLOPSC Alumni Form'),
            Text('OLOPSC Alumni Tracking System (OATS)'),
          ],
        ),
      ),
      body: StreamBuilder(
          stream: alumni.alumni.doc(widget.docID).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var value = snapshot.data;
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.abc,
                        size: 80,
                      ),
                      const Text('Our Lady of Perpetual Succor College'),
                      const Text('Alumni Tracking System'),
                      const SizedBox(
                        height: 12,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Made By: '),
                          Icon(Icons.abc),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          children: [
                            //1st Question
                            QuestionForm(
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        'Are you employed within the year of your graduation?'),
                                  ),
                                  Column(
                                      children: List.generate(
                                    _firstQuestion.length,
                                    (index) => CheckboxListTile(
                                      contentPadding: const EdgeInsets.all(4),
                                      checkboxShape: const CircleBorder(),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      dense: true,
                                      title: Text(
                                        value!['first_name'],
                                        style: const TextStyle(),
                                      ),
                                      value: _firstQuestion[index]['value'],
                                      onChanged: (value) {
                                        setState(() {
                                          for (var element in _firstQuestion) {
                                            element['value'] = false;
                                          }
                                          _firstQuestion[index]['value'] =
                                              value;
                                        });
                                      },
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            //2nd Question
                            QuestionForm(
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        'How relevant is the program you took to your job after graduation?'),
                                  ),
                                  Column(
                                      children: List.generate(
                                    _secondQuestion.length,
                                    (index) => CheckboxListTile(
                                      contentPadding: const EdgeInsets.all(4),
                                      checkboxShape: const CircleBorder(),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      dense: true,
                                      title: Text(
                                        _secondQuestion[index]['answer'],
                                        style: const TextStyle(),
                                      ),
                                      value: _secondQuestion[index]['value'],
                                      onChanged: (value) {
                                        setState(() {
                                          for (var element in _secondQuestion) {
                                            element['value'] = false;
                                          }
                                          _secondQuestion[index]['value'] =
                                              value;
                                        });
                                      },
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            //3rd Question
                            QuestionForm(
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        'Does the program you took helped you land your first job?'),
                                  ),
                                  Column(
                                      children: List.generate(
                                    _thirdQuestion.length,
                                    (index) => CheckboxListTile(
                                      contentPadding: const EdgeInsets.all(4),
                                      checkboxShape: const CircleBorder(),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      dense: true,
                                      title: Text(
                                        _thirdQuestion[index]['answer'],
                                        style: const TextStyle(),
                                      ),
                                      value: _thirdQuestion[index]['value'],
                                      onChanged: (value) {
                                        setState(() {
                                          for (var element in _thirdQuestion) {
                                            element['value'] = false;
                                          }
                                          _thirdQuestion[index]['value'] =
                                              value;
                                        });
                                      },
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            //4th Question
                            QuestionForm(
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        'Were you able to acquire the necessary skills from the program you took that are needed for your current job?'),
                                  ),
                                  Column(
                                      children: List.generate(
                                    _fourthQuestion.length,
                                    (index) => CheckboxListTile(
                                      contentPadding: const EdgeInsets.all(4),
                                      checkboxShape: const CircleBorder(),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      dense: true,
                                      title: Text(
                                        _fourthQuestion[index]['answer'],
                                        style: const TextStyle(),
                                      ),
                                      value: _fourthQuestion[index]['value'],
                                      onChanged: (value) {
                                        setState(() {
                                          for (var element in _fourthQuestion) {
                                            element['value'] = false;
                                          }
                                          _fourthQuestion[index]['value'] =
                                              value;
                                        });
                                      },
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            //5th Question
                            QuestionForm(
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        'Is your job related to your course?'),
                                  ),
                                  Column(
                                      children: List.generate(
                                    _fifthQuestion.length,
                                    (index) => CheckboxListTile(
                                      contentPadding: const EdgeInsets.all(4),
                                      checkboxShape: const CircleBorder(),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      dense: true,
                                      title: Text(
                                        _fifthQuestion[index]['answer'],
                                        style: const TextStyle(),
                                      ),
                                      value: _fifthQuestion[index]['value'],
                                      onChanged: (value) {
                                        setState(() {
                                          for (var element in _fifthQuestion) {
                                            element['value'] = false;
                                          }
                                          _fifthQuestion[index]['value'] =
                                              value;
                                        });
                                      },
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            //6th Question
                            QuestionForm(
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        'What are the skills you aquired from the program you took, that you find helpful in your current job?'),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.newline,
                                    maxLines: 2,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 28),
                            Button(
                              onSubmit: () {},
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: Text('LOADING FORM...'));
            }
          }),
    );
  }
}
