import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String title = "";
String message =
    "This is the place where parents and guardians move their loved ones arounds.";

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account details'),
        actions: <Widget>[
          TextButton.icon(
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: const Text(
                'Sign Out',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onPressed: (() {
                FirebaseAuth.instance.signOut();
              })),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // ignore: prefer_const_constructors
            // Text(
            //   'Zidallie Trips',
            //   style: const TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontFamily: 'Roboto',
            //       fontSize: 25),
            // ),
            Image.asset('assets/zidallie_full.png', scale: 2),

            // const Text(
            //   '\nWhere Guardians Move Their Loved Ones',
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontFamily: 'Roboto',
            //       fontSize: 25),
            // ),
          ],
        ),
      ),
    );
  }
}
