import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:select_form_field/select_form_field.dart';

import '../../widgets/drawer.dart';
import '../../widgets/input_field.dart';
import 'e_drawer.dart';

class NewHire extends StatefulWidget {
  const NewHire({Key? key}) : super(key: key);

  @override
  _NewHireState createState() => _NewHireState();
}

class _NewHireState extends State<NewHire> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _reqController = TextEditingController();
  final TextEditingController _xpController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();

  final List<Map<String, dynamic>> _sizes = [
    {
      'value': 'extra-small',
      'label': 'Extra small',
    },
    {
      'value': 'small',
      'label': 'Small',
    },
    {
      'value': 'medium',
      'label': 'Medium',
    },
    {
      'value': 'medium-large',
      'label': 'Medium Large',
    },
    {
      'value': 'large',
      'label': 'Large',
    },
    {
      'value': 'extra-large',
      'label': 'Extra Large',
    },
    {
      'value': 'humongous',
      'label': "I need a truck",
    },
  ];
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              title: Text("Post a job"),
              leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back,
                    // color: Colors.black,
                  )),
            ),
            drawer: EDrawer(),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: MediaQuery.of(context).size.height,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 16),
                  Text('Fill the form below to post a new job',
                      style: Theme.of(context).textTheme.headline2),
                  SizedBox(height: 16),
                  TextInputField(
                    title: 'Job name *',
                    hint: 'name',
                    controller: _nameController,
                  ),
                  TextInputField(
                    title: 'Service category *',
                    hint: 'what kind of service is it?',
                    controller: _typeController,
                  ),
                  TextInputField(
                    title: 'Job description *',
                    hint: 'give a brief description of the job',
                    controller: _descController,
                  ),
                  TextInputField(
                    title: 'Job requirements *',
                    hint: 'what skills are required?',
                    controller: _reqController,
                  ),
                  TextInputField(
                    title: 'Expertise *',
                    hint: 'what experience level is needed?',
                    controller: _xpController,
                  ),
                  TextInputField(
                    title: 'Job duration *',
                    hint: 'how long will the job take to do?',
                    controller: _xpController,
                  ),
                  TextInputField(
                    title: 'Job clause',
                    hint: 'what is the clause of this job?',
                    controller: _xpController,
                  ),
                  NumInputField(
                    title: 'Hourly rate *',
                    hint: 'how much will you pay per hour?',
                    controller: _rateController,
                  ),
                  NumInputField(
                    title: 'Budget *',
                    hint: 'what is your total budget?',
                    controller: _budgetController,
                  ),
                  SizedBox(height: 16),
                  TextButton(
                      onPressed: () {
                        _validate();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        primary: Colors.white,
                        padding: EdgeInsets.all(20),
                      ),
                      child: Text('Post job'))
                ],
              ),
            )),
      );

  _validate() {
    if (_nameController.text.isEmpty ||
        _budgetController.text.isEmpty ||
        _rateController.text.isEmpty) {
      Get.snackbar('Required 🤨', 'All fields are required !!!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red[800],
          icon: Icon(Icons.warning_rounded, color: Colors.red));
    } else {
      // _addToDB();
      Get.snackbar('Nice 😎', 'Job was created successfully !!!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          colorText: Colors.green[800],
          icon: Icon(Icons.check_circle, color: Colors.green));
      Get.toNamed('/dispatches');
    }
  }
}
