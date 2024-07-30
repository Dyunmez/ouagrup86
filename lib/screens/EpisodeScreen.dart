import 'package:flutter/material.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(4, 2, 30, 1),
      body: Padding(
        padding: const EdgeInsets.only(top: 23, left: 27, right: 27),
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "SÜNGERBOB KAREPANTOLON",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              "14 Sezon",
                              style: TextStyle(color: Colors.orange),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                        height: 159,
                        width: 139,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/spong.png"),
                              fit: BoxFit.cover),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromRGBO(4, 3, 15, 1)),
                      height: 36,
                      width: 139,
                      child: const Center(
                        child: Text(
                          "Hakkında",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromRGBO(253, 155, 8, 1)),
                      height: 36,
                      width: 139,
                      child: const Center(
                        child: Text(
                          "Bölümler",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Tüm Bölümler",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  color: Color.fromRGBO(217, 217, 217, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "1.Sezon",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.keyboard_arrow_up)
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "0/41",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.check_circle_outline_outlined)
                            ],
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Color.fromRGBO(4, 2, 15, 1)),
                    height: 75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 90,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/spong.png"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "SÜNGERBOB KAREPANTOLON",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("S14 | E19",
                                    style: TextStyle(color: Colors.white)),
                                Text("The Dirty Bubble Bass!",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        )
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
