import 'package:alumni_app/compontents/button.dart';
import 'package:alumni_app/compontents/olopsc_form.dart';
import 'package:alumni_app/pages/questions_page_desktop.dart';
import 'package:alumni_app/services/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      'Bachelors of Science in Computer Science',
      'Bachelor of Science in Tourism Management',
      'Bachelor of Science in Hospitality Management',
      'Bachelor of Science in Business Administration',
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
    var screenWidth = MediaQuery.of(context).size.width;
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
      body: Form(
        key: formKey,
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
                height: 75,
              ),
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
                        Expanded(
                          child: DropdownMenu(
                            hintText: 'Sex',
                            onSelected: (String? value) {
                              setState(() {
                                sexController.text = value!;
                                value = null;
                              });
                            },
                            dropdownMenuEntries:
                                sexDropdownItems.map((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
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
                          validator: (value) => value!.isEmpty && value != null
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
                          validator: (value) => value!.isEmpty && value != null
                              ? 'This field is required'
                              : null,
                        )),
                        Expanded(
                          child: OlopscForm(
                            textEditingController: yearGraduatedController,
                            subTitle: const Text('Year Graduated'),
                            suffixIcon: null,
                            validator: (value) =>
                                value!.isEmpty && value != null
                                    ? 'This field is required'
                                    : null,
                          ),
                        ),
                        DropdownMenu(
                          width: 150,
                          hintText: 'Course',
                          onSelected: (String? value) {
                            setState(() {
                              programController.text = value!;
                            });
                          },
                          dropdownMenuEntries: programs.map((String value) {
                            return DropdownMenuEntry<String>(
                              value: value,
                              label: value,
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: DropdownMenu(
                            width: 220,
                            hintText: 'Employement Status',
                            onSelected: (String? value) {
                              setState(() {
                                statusController.text =
                                    value == 'Employed' ? 'true' : 'false';
                              });
                            },
                            dropdownMenuEntries: status.map((String value) {
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
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.blue,
                              ),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                final DocumentReference document =
                                    alumni.alumni.doc(firstNameController.text);
                                setState(() {
                                  document.set({
                                    'email': emailController.text,
                                    'first_name': firstNameController.text,
                                    'last_name': lastNameController.text,
                                    'program': programController.text,
                                    'year_graduated':
                                        int.parse(yearGraduatedController.text),
                                    'sex': sexController.text,
                                    'employment_status':
                                        bool.parse(statusController.text),
                                    'middle_name': middleNameController.text,
                                    'date_of_birth': dateOfBirthController.text,
                                    'occupation': occupationController.text,
                                    'time_stamp': Timestamp.now(),
                                  });
                                });
                                DocumentSnapshot yearData = await alumni.stats
                                    .doc(yearGraduatedController.text)
                                    .get();
                                alumni.stats
                                    .doc(yearGraduatedController.text)
                                    .set({
                                  'value': yearData.get('value') + 1,
                                  'index':
                                      int.parse(yearGraduatedController.text) -
                                          2001,
                                  'year':
                                      int.parse(yearGraduatedController.text),
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
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
