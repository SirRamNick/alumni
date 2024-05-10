import 'package:alumni_app/compontents/button.dart';
import 'package:alumni_app/compontents/olopsc_form.dart';
import 'package:alumni_app/services/firebase.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    // TODO: implement initState
    super.initState();
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
    status = [
      'Employed',
      'Unemployed',
    ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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

  void onSubmit() {
    print(statusController.text);
    setState(() {
      alumni.addAlumnus(
          firstNameController.text,
          lastNameController.text,
          programController.text,
          int.parse(yearGraduatedController.text),
          batchController.text,
          sexController.text,
          bool.parse(statusController.text),
          middleNameController.text,
          dateOfBirthController.text,
          occupationController.text);
    });
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
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.abc,
              size: 80,
            ),
            Text('Our Lady of Perpetual Succor College'),
            Text('Alumni Tracking System'),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Made By: '),
                Icon(Icons.abc),
              ],
            ),
            SizedBox(
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
                        subTitle: Text('First Name'),
                        formKey: formKey,
                        suffixIcon: null,
                      )),
                      Expanded(
                          child: OlopscForm(
                        textEditingController: lastNameController,
                        subTitle: Text('Last Name'),
                        formKey: formKey,
                        suffixIcon: null,
                      )),
                      Expanded(
                        child: OlopscForm(
                          textEditingController: middleNameController,
                          subTitle: Text('Middle Name'),
                          formKey: formKey,
                          suffixIcon: null,
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
                  Row(
                    children: [
                      Expanded(
                          child: OlopscForm(
                        textEditingController: dateOfBirthController,
                        subTitle: Text('Date of Birth'),
                        formKey: formKey,
                        suffixIcon: null,
                      )),
                      Expanded(
                        child: OlopscForm(
                          textEditingController: yearGraduatedController,
                          subTitle: Text('Year Graduated'),
                          formKey: formKey,
                          suffixIcon: null,
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
                  Container(
                    child: statusController.text == 'true'
                        ? OlopscForm(
                            textEditingController: occupationController,
                            subTitle: const Text('Occupation'),
                            formKey: formKey,
                            suffixIcon: null,
                          )
                        : null,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Button(
                    onSubmit: () => onSubmit(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
