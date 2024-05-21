import 'dart:ui';

import 'package:alumni_app/compontents/button.dart';
import 'package:alumni_app/compontents/olopsc_form.dart';
import 'package:alumni_app/compontents/question_content_small.dart';
import 'package:alumni_app/pages/questions_page_desktop.dart';
import 'package:alumni_app/services/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController emailController;
  late final TextEditingController firstNameController;
  late final TextEditingController middleNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController programController;
  late final TextEditingController batchController;
  late final TextEditingController sexController;
  late final TextEditingController statusController;
  late final TextEditingController yearGraduatedController;
  late final TextEditingController dateOfBirthController;
  late final TextEditingController occupationController;
  late final GlobalKey<FormState> formKey;
  late final FirestoreService alumni;
  late final List<String> programs;
  late final List<String> sexDropdownItems;
  late final List<String> status;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    firstNameController = TextEditingController();
    middleNameController = TextEditingController();
    lastNameController = TextEditingController();
    programController = TextEditingController();
    batchController = TextEditingController();
    sexController = TextEditingController();
    statusController = TextEditingController();
    yearGraduatedController = TextEditingController();
    dateOfBirthController = TextEditingController();
    occupationController = TextEditingController();
    formKey = GlobalKey<FormState>();
    alumni = FirestoreService();
    programs = [
      'Bachelor in Elementary Education Major in General Education',
      'Bachelor Secondary Education Major in English ',
      'Bachelor Secondary Education Major in Mathematics ',
      'Bachelor of Arts in English ',
      'BS in Business Administration Major in Marketing Management ',
      'BS in Business Administration Major in Human Resource Management',
      'BS in Entrepreneurship',
      'BS in Hospitality Management / Hotel and Restaurant Management',
      'BS in Tourism Management',
      'BS in Computer Science',
      'Associate in Computer Technology',
      'Teacher Certificate Program',
    ];
    sexDropdownItems = [
      'Male',
      'Female',
    ];
    status = ['Employed', 'Unemployed', 'Self-Employed'];
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    programController.dispose();
    batchController.dispose();
    sexController.dispose();
    statusController.dispose();
    yearGraduatedController.dispose();
    dateOfBirthController.dispose();
    occupationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isLargeScreen = screenWidth < 1100;
    // width size: 1100
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 210, 49, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 210, 49, 1),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.topLeft,
                child: Text('OLOPSC Alumni Form'),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.topRight,
                child: Text('OLOPSC Alumni Tracking System (OATS)'),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://lh3.googleusercontent.com/d/1A9nZdV4Y4kXErJlBOkahkpODE7EVhp1x'),
            alignment: Alignment.bottomLeft,
            scale: 2.5,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  //olopsc logo // olopsc name
                  Image.network(
                      'https://lh3.googleusercontent.com/d/1DlDDvI0eIDivjwvCrngmyKp_Yr6d8oqH',
                      scale: 1.5),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Our Lady of Perpetual Succor College'),
                  const Text('Alumni Tracking System'),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //OCS Logo // Recognition & Credit
                      const Text('Made By: '),
                      Opacity(
                        opacity: 0.9,
                        child: Image.network(
                            'https://lh3.googleusercontent.com/d/19U4DW6KMNsVOqT6ZzX_ikpezY2N24Vyi',
                            scale: 39.5),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  // larger screen
                  if (!isLargeScreen)
                    Container(
                      width: screenWidth * .5,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: OlopscForm(
                                  textEditingController: firstNameController,
                                  subTitle: const Text('First Name'),
                                  suffixIcon: null,
                                  validator: (value) =>
                                      value!.isEmpty && value != null
                                          ? 'This field is required'
                                          : null,
                                ),
                              ),
                              Expanded(
                                child: OlopscForm(
                                  textEditingController: lastNameController,
                                  subTitle: const Text('Last Name'),
                                  suffixIcon: null,
                                  validator: (value) =>
                                      value!.isEmpty && value != null
                                          ? 'This field is required'
                                          : null,
                                ),
                              ),
                              Expanded(
                                child: OlopscForm(
                                  textEditingController: middleNameController,
                                  subTitle: const Text('Middle Name'),
                                  suffixIcon: null,
                                  validator: (value) =>
                                      value!.isEmpty && value != null
                                          ? 'This field is required'
                                          : null,
                                ),
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: const Row(
                                    children: [
                                      Icon(Icons.list),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Sex',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.yellow,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: sexDropdownItems
                                      .map(
                                        (item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  value: sexDropdownItems.first,
                                  onChanged: (value) {},
                                  buttonStyleData: ButtonStyleData(
                                    height: 50,
                                    width: 160,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      color: Colors.blue,
                                    ),
                                    elevation: 2,
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(Icons.arrow_forward_outlined),
                                    iconSize: 14,
                                    iconEnabledColor: Colors.yellow,
                                    iconDisabledColor: Colors.grey,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.yellow,
                                    ),
                                    offset: const Offset(-20, 0),
                                    scrollbarTheme: ScrollbarThemeData(
                                      radius: Radius.circular(40),
                                      thickness: MaterialStateProperty.all(6),
                                      thumbVisibility:
                                          MaterialStateProperty.all(true),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: OlopscForm(
                                subTitle: const Text('Email'),
                                textEditingController: emailController,
                                suffixIcon: null,
                                validator: (value) =>
                                    value!.isEmpty && value != null
                                        ? 'This field is required'
                                        : null,
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: OlopscForm(
                                textEditingController: dateOfBirthController,
                                subTitle: const Text('Date of Birth'),
                                suffixIcon: null,
                                validator: (value) =>
                                    value!.isEmpty && value != null
                                        ? 'This field is required'
                                        : null,
                              )),
                              Expanded(
                                child: OlopscForm(
                                  textEditingController:
                                      yearGraduatedController,
                                  subTitle: const Text('Year Graduated'),
                                  suffixIcon: null,
                                  validator: (value) =>
                                      value!.isEmpty && value != null
                                          ? 'This field is required'
                                          : null,
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: DropdownMenu(
                                  width: 300,
                                  hintText: 'Course',
                                  onSelected: (String? value) {
                                    setState(() {
                                      programController.text = value!;
                                    });
                                  },
                                  dropdownMenuEntries:
                                      programs.map((String value) {
                                    return DropdownMenuEntry<String>(
                                      value: value,
                                      label: value,
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                color: Colors.white,
                                child: Expanded(
                                  child: DropdownMenu(
                                    width: 220,
                                    hintText: 'Employement Status',
                                    onSelected: (String? value) {
                                      setState(() {
                                        statusController.text =
                                            value == 'Employed'
                                                ? 'true'
                                                : 'false';
                                      });
                                    },
                                    dropdownMenuEntries:
                                        status.map((String value) {
                                      return DropdownMenuEntry<String>(
                                        value: value,
                                        label: value,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: statusController.text == 'true'
                                ? OlopscForm(
                                    textEditingController: occupationController,
                                    subTitle: const Text('Occupation'),
                                    suffixIcon: null,
                                    validator: (value) =>
                                        value!.isEmpty && value != null
                                            ? 'This field is required'
                                            : null,
                                  )
                                : null,
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 100,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                        const Color.fromRGBO(11, 10, 95, 1),
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        final DocumentReference document =
                                            alumni.alumni
                                                .doc(firstNameController.text);
                                        setState(() {
                                          document.set({
                                            'email': emailController.text,
                                            'first_name':
                                                firstNameController.text,
                                            'last_name':
                                                lastNameController.text,
                                            'program': programController.text,
                                            'year_graduated': int.parse(
                                                yearGraduatedController.text),
                                            'sex': sexController.text,
                                            'employment_status': bool.parse(
                                                statusController.text),
                                            'middle_name':
                                                middleNameController.text,
                                            'date_of_birth':
                                                dateOfBirthController.text,
                                            'occupation':
                                                occupationController.text,
                                            'time_stamp': Timestamp.now(),
                                          });
                                        });
                                        DocumentSnapshot yearData = await alumni
                                            .stats
                                            .doc(yearGraduatedController.text)
                                            .get();
                                        alumni.stats
                                            .doc(yearGraduatedController.text)
                                            .set({
                                          'value': yearData.get('value') + 1,
                                          'index': int.parse(
                                                  yearGraduatedController
                                                      .text) -
                                              2001,
                                          'year': int.parse(
                                              yearGraduatedController.text),
                                        });
                                        emailController.clear();
                                        firstNameController.clear();
                                        middleNameController.clear();
                                        lastNameController.clear();
                                        programController.clear();
                                        batchController.clear();
                                        sexController.clear();
                                        statusController.clear();
                                        yearGraduatedController.clear();
                                        dateOfBirthController.clear();
                                        occupationController.clear();
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => QuestionsPage(
                                              docID: document.id,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                        color: const Color.fromRGBO(
                                            255, 210, 49, 1),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  // Smaller Screen
                  else
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                //first name
                                OlopscForm(
                                  textEditingController: firstNameController,
                                  subTitle: const Text('First Name'),
                                  suffixIcon: null,
                                  validator: (value) =>
                                      value!.isEmpty && value != null
                                          ? 'This field is required'
                                          : null,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                //last name
                                OlopscForm(
                                  textEditingController: lastNameController,
                                  subTitle: const Text('Last Name'),
                                  suffixIcon: null,
                                  validator: (value) =>
                                      value!.isEmpty && value != null
                                          ? 'This field is required'
                                          : null,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                // middle name
                                OlopscForm(
                                  textEditingController: middleNameController,
                                  subTitle: const Text('Middle Name'),
                                  suffixIcon: null,
                                  validator: (value) =>
                                      value!.isEmpty && value != null
                                          ? 'This field is required'
                                          : null,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                // Email
                                OlopscForm(
                                  subTitle: const Text('Email'),
                                  textEditingController: emailController,
                                  suffixIcon: null,
                                  validator: (value) =>
                                      value!.isEmpty && value != null
                                          ? 'This field is required'
                                          : null,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                //date of birth
                                OlopscForm(
                                  textEditingController: dateOfBirthController,
                                  subTitle: const Text('Date of Birth'),
                                  suffixIcon: null,
                                  validator: (value) =>
                                      value!.isEmpty && value != null
                                          ? 'This field is required'
                                          : null,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                //year graduated
                                OlopscForm(
                                  textEditingController:
                                      yearGraduatedController,
                                  subTitle: const Text('Year Graduated'),
                                  suffixIcon: null,
                                  validator: (value) =>
                                      value!.isEmpty && value != null
                                          ? 'This field is required'
                                          : null,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Wrap(
                                  spacing: 20.0,
                                  runSpacing: 20.0,
                                  children: <Widget>[
                                    //course
                                    Container(
                                      color: Colors.white,
                                      child: DropdownMenu(
                                        width: 300,
                                        hintText: 'Course',
                                        onSelected: (String? value) {
                                          setState(() {
                                            programController.text = value!;
                                          });
                                        },
                                        dropdownMenuEntries:
                                            programs.map((String value) {
                                          return DropdownMenuEntry<String>(
                                            value: value,
                                            label: value,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    //Gender
                                    Container(
                                      color: Colors.white,
                                      child: DropdownMenu(
                                        hintText: 'Sex',
                                        onSelected: (String? value) {
                                          setState(() {
                                            sexController.text = value!;
                                            value = null;
                                          });
                                        },
                                        dropdownMenuEntries: sexDropdownItems
                                            .map((String value) {
                                          return DropdownMenuEntry<String>(
                                              value: value, label: value);
                                        }).toList(),
                                      ),
                                    ),
                                    // Employment Status
                                    Container(
                                      color: Colors.white,
                                      child: DropdownMenu(
                                        width: 220,
                                        hintText: 'Employement Status',
                                        onSelected: (String? value) {
                                          setState(() {
                                            statusController.text =
                                                value == 'Employed'
                                                    ? 'true'
                                                    : 'false';
                                          });
                                        },
                                        dropdownMenuEntries:
                                            status.map((String value) {
                                          return DropdownMenuEntry<String>(
                                            value: value,
                                            label: value,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: statusController.text == 'true'
                                      ? OlopscForm(
                                          textEditingController:
                                              occupationController,
                                          subTitle: const Text('Occupation'),
                                          suffixIcon: null,
                                          validator: (value) =>
                                              value!.isEmpty && value != null
                                                  ? 'This field is required'
                                                  : null,
                                        )
                                      : null,
                                ),
                                const SizedBox(
                                  height: 28,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border:
                                              Border.all(color: Colors.white)),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            shadowColor:
                                                MaterialStatePropertyAll(
                                                    Colors.white),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                              Color.fromRGBO(11, 10, 95, 1),
                                            ),
                                          ),
                                          onPressed: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              final DocumentReference document =
                                                  alumni.alumni.doc(
                                                      firstNameController.text);
                                              setState(() {
                                                document.set({
                                                  'email': emailController.text,
                                                  'first_name':
                                                      firstNameController.text,
                                                  'last_name':
                                                      lastNameController.text,
                                                  'program':
                                                      programController.text,
                                                  'year_graduated': int.parse(
                                                      yearGraduatedController
                                                          .text),
                                                  'sex': sexController.text,
                                                  'employment_status':
                                                      bool.parse(
                                                          statusController
                                                              .text),
                                                  'middle_name':
                                                      middleNameController.text,
                                                  'date_of_birth':
                                                      dateOfBirthController
                                                          .text,
                                                  'occupation':
                                                      occupationController.text,
                                                  'time_stamp': Timestamp.now(),
                                                });
                                              });
                                              DocumentSnapshot yearData =
                                                  await alumni.stats
                                                      .doc(
                                                          yearGraduatedController
                                                              .text)
                                                      .get();
                                              alumni.stats
                                                  .doc(yearGraduatedController
                                                      .text)
                                                  .set({
                                                'value':
                                                    yearData.get('value') + 1,
                                                'index': int.parse(
                                                        yearGraduatedController
                                                            .text) -
                                                    2001,
                                                'year': int.parse(
                                                    yearGraduatedController
                                                        .text),
                                              });
                                              emailController.clear();
                                              firstNameController.clear();
                                              middleNameController.clear();
                                              lastNameController.clear();
                                              programController.clear();
                                              batchController.clear();
                                              sexController.clear();
                                              statusController.clear();
                                              yearGraduatedController.clear();
                                              dateOfBirthController.clear();
                                              occupationController.clear();
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      QuestionsPage(
                                                    docID: document.id,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                          child: Text(
                                            'Next',
                                            style: TextStyle(
                                              color: const Color.fromRGBO(
                                                  255, 210, 49, 1),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
