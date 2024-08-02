// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oua_bootcamp/screens/HomeScreen.dart';
import 'package:oua_bootcamp/screens/TvSeriesScreen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String email = FirebaseAuth.instance.currentUser!.email ?? "";
  String name = FirebaseAuth.instance.currentUser!.displayName ?? "";
  void updateProfile() {
    FirebaseAuth.instance.currentUser!.updateDisplayName(name);
    //FirebaseAuth.instance.currentUser!.verifyBeforeUpdateEmail(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 2, 30, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Hesap Bilgileri",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              EditItem(
                  TextFormField(
                    initialValue:
                        FirebaseAuth.instance.currentUser!.displayName ?? "",
                    onChanged: (value) {
                      name = value;
                    },
                    style: const TextStyle(color: Colors.white),
                  ),
                  "İsim"),
              const SizedBox(height: 40),
              EditItem(
                TextFormField(
                  initialValue: FirebaseAuth.instance.currentUser!.email,
                  onChanged: (value) {
                    email = value;
                  },
                  style: const TextStyle(color: Colors.white),
                ),
                "E-Mail",
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        updateProfile();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TvSeriesScreen(),
                          ),
                        ).then((value) => setState(() {}));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(253, 155, 8, 1))),
                      child: Text("Güncelle",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        ).then((value) => setState(() {}));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(253, 155, 8, 1))),
                      child: Text("Çıkış Yap",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget EditItem(Widget widget, String title) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 2,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
      const SizedBox(width: 35),
      Expanded(
        flex: 5,
        child: widget,
      )
    ],
  );
}
