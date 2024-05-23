import 'package:flutter/material.dart';

class ProfileLayout extends StatefulWidget {
  const ProfileLayout({super.key});

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 210, 49, 1),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 226, 226, 226),
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Olopsc Alumni Tracking System (OATS)',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Wrap(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Welcome Name, Name!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        margin: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: <Widget>[
                            const Divider(),
                            const SizedBox(height: 5),
                            //Profile Information
                            const Row(
                              children: [
                                Text(
                                    textAlign: TextAlign.left,
                                    'Profile information',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom:
                                                        BorderSide(width: 0))),
                                            child: const Text(''),
                                          ),
                                          Container(
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      top: BorderSide(
                                                          width: 0))),
                                              child: const Text(
                                                '   First Name   ',
                                                style: TextStyle(fontSize: 11),
                                              ))
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom:
                                                        BorderSide(width: 0))),
                                            child: const Text(''),
                                          ),
                                          Container(
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      top: BorderSide(
                                                          width: 0))),
                                              child: const Text(
                                                '   Middle Name   ',
                                                style: TextStyle(fontSize: 11),
                                              ))
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom:
                                                        BorderSide(width: 0))),
                                            child: const Text(''),
                                          ),
                                          Container(
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      top: BorderSide(
                                                          width: 0))),
                                              child: const Text(
                                                '   Last Name   ',
                                                style: TextStyle(fontSize: 11),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(width: 0))),
                                      child: const Text(''),
                                    ),
                                    Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                top: BorderSide(width: 0))),
                                        child: const Text(
                                          '   Degree   ',
                                          style: TextStyle(fontSize: 11),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(width: 0))),
                                      child: const Text(''),
                                    ),
                                    Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                top: BorderSide(width: 0))),
                                        child: const Text(
                                          '   Email   ',
                                          style: TextStyle(fontSize: 11),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(width: 0))),
                                      child: const Text(''),
                                    ),
                                    Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                top: BorderSide(width: 0))),
                                        child: const Text(
                                          '   Date of birth   ',
                                          style: TextStyle(fontSize: 11),
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(width: 0))),
                                      child: const Text(''),
                                    ),
                                    Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                top: BorderSide(width: 0))),
                                        child: const Text(
                                          '   Year Graduated   ',
                                          style: TextStyle(fontSize: 11),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(width: 0))),
                                      child: const Text(''),
                                    ),
                                    Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                top: BorderSide(width: 0))),
                                        child: const Text(
                                          '   Employment Status   ',
                                          style: TextStyle(fontSize: 11),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(width: 0))),
                                      child: const Text(''),
                                    ),
                                    Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                top: BorderSide(width: 0))),
                                        child: const Text(
                                          '   Occupation   ',
                                          style: TextStyle(fontSize: 11),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 5,
                            ),
                            const Row(
                              children: [
                                Text(
                                    textAlign: TextAlign.left,
                                    'Questions Information',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                      'What are the life skills OLOPSC has taught you?'),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 2, bottom: 2),
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1)),
                                    child: const Text(
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                        ''),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                      'The skills you\'ve mentioned helped you in pursuing your career path.'),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 2, bottom: 2),
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1)),
                                    child: const Text(
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                        ''),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                      'Your first job aligns with your current job.'),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 2, bottom: 2),
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1)),
                                    child: const Text(
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                        ''),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                      'How long does it take for you to land your first job after graduation?'),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 2, bottom: 2),
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1)),
                                    child: const Text(
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                        ''),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                      'The program you took in OLOPSC matches your current job.'),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 2, bottom: 2),
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1)),
                                    child: const Text(
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                        ''),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                      'You are satisfied with your current job.'),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 2, bottom: 2),
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1)),
                                    child: const Text(
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                        ''),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
