import 'package:alumni_app/compontents/profile_content.dart';
import 'package:alumni_app/services/firebase.dart';
import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  final String docID;
  const Profile({
    super.key,
    required this.docID,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirestoreService alumni = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 226, 226, 226),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Olopsc Alumni Tracking System (OATS)',
          ),
        ),
      ),
        body: Column(
          children: [
            Center(
              child: StreamBuilder(
                stream: alumni.alumni.doc(widget.docID).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var value = snapshot.data;
                    return SingleChildScrollView(
                      child: Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 100, left: 20, top: 100, bottom: 7),
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 100),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(color: Colors.white)),
                              child: Container(
                                padding: EdgeInsets.all(25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    //question 1
                                    Align(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            'Are you satisfied with your current status?',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: ProfileContent(
                                          contentprofile: value!['question_1']),
                                    ),
                                    //question 2
                                    Align(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            'Were you employed within the year of your graduation?',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: ProfileContent(
                                          contentprofile: value!['question_2']),
                                    ),
                                    //question 3
                                    Align(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            'How relevant was the program to your job post-graduation?',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: ProfileContent(
                                          contentprofile: value!['question_3']),
                                    ),
                                    //question 4
                                    Align(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            'Did the program help in applying for your current occupation?',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: ProfileContent(
                                          contentprofile: value!['question_4']),
                                    ),
                                    //question 5
                                    Align(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            'Did the program provide the necessary skills needed for your current job?',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: ProfileContent(
                                          contentprofile: value!['question_5']),
                                    ),
                                    //question 6
                                    Align(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            'What were the necessary skills you acquired from the program needed for your current job?',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: ProfileContent(
                                          contentprofile: value!['question_6']),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                      ),
                    );
                  } else {
                    return Text('Loading Data');
                  }
                },
              ),
            ),
          ],
        )
    );
  }
}
