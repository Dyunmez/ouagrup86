import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oua_bootcamp/screens/EpisodeScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    //kayitOl();
  }

  void girisYap(eposta, sifre) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: eposta,
        password: sifre,
      );
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const EpisodeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Kullanıcı adı veya şifre hatalı. Lütfen tekrar deneyin.'),
        ),
      );
    }
  }
  /*
   email: "nazmiaras@yahoo.com",
        password: "123123123",
  */

  void kayitOl(eposta, sifre) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: eposta, password: sifre);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: eposta,
        password: sifre,
      );
      MaterialPageRoute(builder: (context) => const EpisodeScreen());
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lütfen tekrar deneyin.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String eposta = "";
    String sifre = "";
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 2, 30, 1),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 109,
            ),
            Image.asset("assets/images/logo.png"),
            SizedBox(
              height: 77,
            ),
            SizedBox(
              height: 300,
              width: 350,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 350,
                    child: TextField(
                      onChanged: (value) => eposta = value,
                      decoration: const InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 50,
                    width: 350,
                    child: TextField(
                      onChanged: (value) => sifre = value,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () {
                        girisYap(eposta, sifre);
                      },
                      child: Text("Giriş Yap >",
                          style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(253, 155, 8, 1))),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () {
                        kayitOl(eposta, sifre);
                      },
                      child: const Text("Kayıt Ol >",
                          style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(253, 155, 8, 1))),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
