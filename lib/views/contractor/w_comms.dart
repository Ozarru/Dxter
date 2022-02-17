import 'package:flutter/cupertino.dart';

class Comms extends StatefulWidget {
  const Comms({Key? key}) : super(key: key);

  @override
  _CommsState createState() => _CommsState();
}

class _CommsState extends State<Comms> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('No comms yet, what did you expect? introvert :)'),
      ),
    );
  }
}
