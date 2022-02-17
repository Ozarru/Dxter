import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/profile.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget(
      {Key? key,
      required this.imagePath,
      required this.onClicked,
      required this.isEdit})
      : super(key: key);
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Stack(children: [
          buildImage(),
          Positioned(
              bottom: 0,
              right: 4,
              child: InkWell(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditProfile())),
                  child: buildEditIcon(color, context)))
        ]),
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 96,
          height: 96,
          child: InkWell(
            onTap: onClicked,
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color, context) => buildCircle(
        color: Colors.grey.shade50,
        all: 3,
        child: buildCircle(
          color: Theme.of(context).primaryColor,
          // color: Color(0xff00ADFF),
          all: 6,
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: 18,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required Color color,
    required double all,
  }) =>
      ClipOval(
        child:
            Container(padding: EdgeInsets.all(all), color: color, child: child),
      );
}
