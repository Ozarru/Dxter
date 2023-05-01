import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:select_form_field/select_form_field.dart';

import '../../widgets/drawer.dart';
import '../../widgets/input_field.dart';
import 'w_drawer.dart';

class PostService extends StatefulWidget {
  const PostService({Key? key}) : super(key: key);

  @override
  _PostServiceState createState() => _PostServiceState();
}

class _PostServiceState extends State<PostService> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _xpController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              title: Text("Post a service"),
              leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back,
                    // color: Colors.black,
                  )),
            ),
            drawer: WDrawer(),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: MediaQuery.of(context).size.height,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 16),
                  Text('Fill the form below to post a new Service',
                      style: Theme.of(context).textTheme.headline2),
                  SizedBox(height: 16),
                  TextInputField(
                    title: 'Service name *',
                    hint: 'I will do ...',
                    controller: _nameController,
                  ),
                  TextInputField(
                    title: 'Service category *',
                    hint: 'what kind of service is it?',
                    controller: _typeController,
                  ),
                  TextAreaField(
                    title: 'Service description *',
                    hint: 'give a brief description of the Service',
                    controller: _descController,
                  ),
                  TextInputField(
                    title: 'Expertise *',
                    hint: 'what is your level of experience?',
                    controller: _xpController,
                  ),
                  NumInputField(
                    title: 'Hourly rate *',
                    hint: 'how much do you charge per hour?',
                    controller: _rateController,
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
                      child: Text('Post Service'))
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
      Get.snackbar('Nice 😎', 'Service was created successfully !!!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          colorText: Colors.green[800],
          icon: Icon(Icons.check_circle, color: Colors.green));
      Get.toNamed('/my-services');
    }
  }
}
