import 'package:alumni_app/compontents/profile_content.dart';
import 'package:alumni_app/compontents/profile_user.dart';
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
        backgroundColor: const Color.fromRGBO(255, 210, 49, 1),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 226, 226, 226),
          title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Olopsc Alumni Tracking System (OATS)',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
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
                            child: Container(
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color.fromRGBO(11, 10, 95, 1),
                              ),
                              child: Wrap(
                                spacing: 8.0,
                                runSpacing: 4.0,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //Welcoming Message
                                      Wrap(
                                        spacing: 8.0,
                                        runSpacing: 4.0,
                                        children: <Widget>[
                                          Align(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  'Welcome ${value!['last_name']}, ${value!['first_name']}!',
                                                  style: TextStyle(
                                                      color:
                                                          const Color.fromRGBO(
                                                              255, 210, 49, 1),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 30)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          //name
                                          Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text('Name',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: const Color
                                                            .fromRGBO(
                                                            255, 210, 49, 1),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16)),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: ProfileUser(
                                                    userDescribe:
                                                        '${value!['first_name']} ${value!['middle_name']} ${value!['last_name']}'),
                                              ),
                                            ],
                                          ),
                                          //sex
                                          Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text('Sex',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: const Color
                                                            .fromRGBO(
                                                            255, 210, 49, 1),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16)),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: ProfileUser(
                                                    userDescribe:
                                                        '${value!['sex']}'),
                                              ),
                                            ],
                                          ),
                                          //year graduated
                                          Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text('Year Graduated',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: const Color
                                                            .fromRGBO(
                                                            255, 210, 49, 1),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16)),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: ProfileUser(
                                                    userDescribe:
                                                        '${value!['year_graduated']}'),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      //name of alumni

                                      //sex

                                      // program

                                      // year graduated

                                      //employment status

                                      // email adress
                                      Align(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              'Are you satisfied with your current status?',
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      255, 210, 49, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: ProfileContent(
                                            contentprofile: value!['email']),
                                      ),
                                      //question 1
                                      Align(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              'Are you satisfied with your current status?',
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      255, 210, 49, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: ProfileContent(
                                            contentprofile:
                                                value!['question_1']),
                                      ),
                                      //question 2
                                      Align(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              'Were you employed within the year of your graduation?',
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      255, 210, 49, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: ProfileContent(
                                            contentprofile:
                                                value!['question_2']),
                                      ),
                                      //question 3
                                      Align(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              'How relevant was the program to your job post-graduation?',
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      255, 210, 49, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: ProfileContent(
                                            contentprofile:
                                                value!['question_3']),
                                      ),
                                      //question 4
                                      Align(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              'Did the program help in applying for your current occupation?',
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      255, 210, 49, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: ProfileContent(
                                            contentprofile:
                                                value!['question_4']),
                                      ),
                                      //question 5
                                      Align(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              'Did the program provide the necessary skills needed for your current job?',
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      255, 210, 49, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: ProfileContent(
                                            contentprofile:
                                                value!['question_5']),
                                      ),
                                      //question 6
                                      Align(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              'What were the necessary skills you acquired from the program needed for your current job?',
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      255, 210, 49, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: ProfileContent(
                                            contentprofile:
                                                value!['question_6']),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      );
                    } else {
                      return Text('Loading Data');
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
