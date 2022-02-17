import 'package:dxter/models/userModel.dart';
import 'package:dxter/utils/user_preferences.dart';
import 'package:dxter/widgets/profile_widget.dart';
import 'package:dxter/widgets/textfield_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 16),
          Row(
            children: [
              ProfileWidget(
                isEdit: false,
                imagePath: user.photoURL!,
                onClicked: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.displayName!,
                        style: Theme.of(context).textTheme.headline2),
                    SizedBox(height: 8),
                    Text(user.email!),
                    Text(user.phoneNumber!),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserProfile user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(
            height: 18,
          ),
          TextFieldWidget(
            label: 'Full name',
            text: user.name,
            onChanged: (name) {},
          ),
          const SizedBox(
            height: 18,
          ),
          TextFieldWidget(
            label: 'Email',
            text: user.email,
            onChanged: (name) {},
          ),
          const SizedBox(
            height: 18,
          ),
          TextFieldWidget(
            label: 'Phone number',
            text: user.phone,
            onChanged: (name) {},
          ),
          const SizedBox(
            height: 18,
          ),
          TextFieldWidget(
            maxLines: 5,
            label: 'About me',
            text: user.about,
            onChanged: (name) {},
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(Colors.grey.shade200),
                backgroundColor: MaterialStateProperty.all(Colors.black87),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Save changes',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
