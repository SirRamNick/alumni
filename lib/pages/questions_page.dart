import 'package:alumni_app/compontents/button.dart';
import 'package:alumni_app/compontents/question_form.dart';
import 'package:alumni_app/pages/navigation_page.dart';
// import 'package:alumni_app/pages/navigation_page.dart';
import 'package:alumni_app/services/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  late final TextEditingController question1Controller =
      TextEditingController();
  late final TextEditingController question2Controller =
      TextEditingController();
  late final TextEditingController question3Controller =
      TextEditingController();
  late final TextEditingController question4Controller =
      TextEditingController();
  late final TextEditingController question5Controller =
      TextEditingController();
  late final TextEditingController question6Controller =
      TextEditingController();
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final FirestoreService alumni = FirestoreService();

  late final List<String> listOfAnswers1 = [
    'Yes',
    'No',
  ];
  late final List<String> listOfAnswers2 = [
    'Not relevant at all',
    'Somewhat relevant',
    'Very relevant',
  ];
  late final List<String> listOfAnswers3 = [
    'Not helpful',
    'Somewhat helpful',
    'Very helpful',
  ];
  late final List<String> listOfAnswers4 = [
    'No',
    'Somehow',
    'Yes',
  ];
  late final List<String> listOfAnswers5 = [
    'Not relevant at all',
    'Somewhat relevant',
    'Same/very relevant',
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: DropdownMenu(
                                      width: 150,
                                      hintText: '-Select-',
                                      onSelected: (String? value) {
                                        setState(() {
                                          question1Controller.text = value!;
                                        });
                                      },
                                      dropdownMenuEntries:
                                          listOfAnswers1.map((String value) {
                                        return DropdownMenuEntry<String>(
                                          value: value,
                                          label: value,
                                        );
                                      }).toList(),
                                    ),
                                  ),
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: DropdownMenu(
                                      width: 150,
                                      hintText: '-Select-',
                                      onSelected: (String? value) {
                                        setState(() {
                                          question2Controller.text = value!;
                                        });
                                      },
                                      dropdownMenuEntries:
                                          listOfAnswers2.map((String value) {
                                        return DropdownMenuEntry<String>(
                                          value: value,
                                          label: value,
                                        );
                                      }).toList(),
                                    ),
                                  ),
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: DropdownMenu(
                                      width: 150,
                                      hintText: '-Select-',
                                      onSelected: (String? value) {
                                        setState(() {
                                          question3Controller.text = value!;
                                        });
                                      },
                                      dropdownMenuEntries:
                                          listOfAnswers3.map((String value) {
                                        return DropdownMenuEntry<String>(
                                          value: value,
                                          label: value,
                                        );
                                      }).toList(),
                                    ),
                                  ),
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: DropdownMenu(
                                      width: 150,
                                      hintText: '-Select-',
                                      onSelected: (String? value) {
                                        setState(() {
                                          question4Controller.text = value!;
                                        });
                                      },
                                      dropdownMenuEntries:
                                          listOfAnswers4.map((String value) {
                                        return DropdownMenuEntry<String>(
                                          value: value,
                                          label: value,
                                        );
                                      }).toList(),
                                    ),
                                  ),
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: DropdownMenu(
                                      width: 150,
                                      hintText: '-Select-',
                                      onSelected: (String? value) {
                                        setState(() {
                                          question5Controller.text = value!;
                                        });
                                      },
                                      dropdownMenuEntries:
                                          listOfAnswers5.map((String value) {
                                        return DropdownMenuEntry<String>(
                                          value: value,
                                          label: value,
                                        );
                                      }).toList(),
                                    ),
                                  ),
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
                                    controller: question6Controller,
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.newline,
                                    maxLines: 2,
                                    validator: (value) =>
                                        value!.isEmpty && value != null
                                            ? 'This field is required'
                                            : null,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 28),
                            Button(
                              onSubmit: () {
                                if (formKey.currentState!.validate()) {
                                  final DocumentReference document = alumni
                                      .alumni
                                      .doc(question6Controller.text);
                                  setState(() {
                                    document.set({
                                      'question_1': question1Controller,
                                      'question_2': question2Controller,
                                      'question_3': question3Controller,
                                      'question_4': question4Controller,
                                      'question_5': question5Controller,
                                      'question_6': question6Controller,
                                    });
                                  });
                                  question1Controller.clear();
                                  question2Controller.clear();
                                  question3Controller.clear();
                                  question4Controller.clear();
                                  question5Controller.clear();
                                  question6Controller.clear();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NavigationPage(),
                                    ),
                                  );
                                }
                              },
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



//nightmare

                                  // Column(
                                  //     children: List.generate(
                                  //   _fifthQuestion.length,
                                  //   (index) => CheckboxListTile(
                                  //     contentPadding: const EdgeInsets.all(4),
                                  //     checkboxShape: const CircleBorder(),
                                  //     controlAffinity:
                                  //         ListTileControlAffinity.leading,
                                  //     dense: true,
                                  //     title: Text(
                                  //       _fifthQuestion[index]['answer'],
                                  //       style: const TextStyle(),
                                  //     ),
                                  //     value: _fifthQuestion[index]['value'],
                                  //     onChanged: (value) {
                                  //       setState(() {
                                  //         for (var element in _fifthQuestion) {
                                  //           element['value'] = false;
                                  //         }
                                  //         _fifthQuestion[index]['value'] =
                                  //             value;
                                  //       });
                                  //     },
                                  //   ),
                                  // )),


// final List _firstQuestion = [
//     {'value': false, 'answer': 'yes'},
//     {'value': false, 'answer': 'no'},
//   ];

//   // final List _secondQuestion = [
//   //   {'value': false, 'answer': 'Not relevant at all'},
//   //   {'value': false, 'answer': 'Somewhat relevant'},
//   //   {'value': false, 'answer': 'Very relevant'},
//   // ];

//   final List _thirdQuestion = [
//     {'value': false, 'answer': 'Not helpful at all'},
//     {'value': false, 'answer': 'Somewhat helpful'},
//     {'value': false, 'answer': 'Very helpful'},
//   ];

//   final List _fourthQuestion = [
//     {'value': false, 'answer': 'No'},
//     {'value': false, 'answer': 'Somehow'},
//     {'value': false, 'answer': 'Yes'},
//   ];

//   final List _fifthQuestion = [
//     {'value': false, 'answer': 'Not relevant at all'},
//     {'value': false, 'answer': 'Somewhat relevant'},
//     {'value': false, 'answer': 'Same/very relevant'},
//   ];
