import 'package:dxter/widgets/tiles.dart';
import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            // height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/dex.jpg'), fit: BoxFit.cover),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.2,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/branding/longw.png'),
                  height: 60,
                ),
                Text(
                  'Services rendered by experts,',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  'anytime, anyday.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 70,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntroTile(
                    image: 'assets/hire.png',
                    name: 'Hire a hand',
                    route: '/e-base'),
                IntroTile(
                    image: 'assets/work.png',
                    name: 'Give a hand',
                    route: '/w-base'),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20.0),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () {}, child: Text('Sign-in')),
                  TextButton(onPressed: () {}, child: Text('Skip')),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
