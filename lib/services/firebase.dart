import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference alumni =
      FirebaseFirestore.instance.collection('alumni');

  Future addAlumnus(
    String email,
    String firstName,
    String lastName,
    String program,
    int yearGraduated,
    String sex,
    bool employmentStatus,
    String middleName,
    String dateOfBirth,
    String occupation, {
    String? question_1,
    String? question_2,
    String? question_3,
    String? question_4,
    String? question_5,
    String? question_6,
  }) {
    setSearchParam(String firstName, String lastName) {
      final String name = '$firstName $lastName';
      List<String> caseSearchList = [];
      String temp = '';

      for (int i = 0; i < name.length; i++) {
        temp += name[i];
        caseSearchList.add(temp.toLowerCase());
      }
      return caseSearchList;
    }

    return alumni.add({
      'email': email,
      'first_name': firstName,
      'middle_name': middleName,
      'last_name': lastName,
      'date_of_birth': dateOfBirth,
      'sex': sex,
      'program': program,
      'year_graduated': yearGraduated,
      'employment_status': employmentStatus,
      'occupation': occupation,
      'searchable_name': setSearchParam(firstName, lastName),
      'question_1': question_1,
      'question_2': question_2,
      'question_3': question_3,
      'question_4': question_4,
      'question_5': question_5,
      'question_6': question_6,
    });
  }

  Future updateResponse(
    String docID,
    String? question_1,
    String? question_2,
    String? question_3,
    String? question_4,
    String? question_5,
    String? question_6,
  ) {
    return alumni.doc(docID).update({
      'question_1': question_1,
      'questio_2': question_2,
      'question_3': question_3,
      'question_4': question_4,
      'question_5': question_5,
      'question_6': question_6,
    });
  }
}
