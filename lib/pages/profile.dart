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
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 300,
                            ),
                            Container(
                              color: Colors.blue,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ProfileContent(
                                    contentprofile: Text(value!['question_1'])),
                              ),
                            ),
                          ],
                        ),
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
