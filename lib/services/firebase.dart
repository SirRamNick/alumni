import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference alumni =
      FirebaseFirestore.instance.collection('alumni');

  Future addAlumnus(
      String firstName,
      String lastName,
      String program,
      int yearGraduated,
      String batch,
      String sex,
      bool employmentStatus,
      String middleName,
      String dateOfBirth,
      String occupation) {
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
      'first_name': firstName,
      'middle_name': middleName,
      'last_name': lastName,
      'date_of_birth': dateOfBirth,
      'sex': sex,
      'program': program,
      'year_graduated': yearGraduated,
      'batch': batch,
      'employment_status': employmentStatus,
      'occupation': occupation,
      'searchable_name': setSearchParam(firstName, lastName),
    });
  }
}
