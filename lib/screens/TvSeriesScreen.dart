import 'package:flutter/material.dart';

class TvSeriesScreen extends StatelessWidget {
  const TvSeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 2, 30, 1),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 53, left: 33, right: 33),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(4, 2, 31, 1)),
                    height: 36,
                    width: 139,
                    child: const Center(
                      child: Text(
                        "Yakalaşan Dizi/Film",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(253, 155, 8, 1)),
                    height: 36,
                    width: 139,
                    child: const Center(
                      child: Text(
                        "İzleme Listem",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 40,
                width: 114,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(217, 217, 217, 1)),
                child: const Center(
                  child: Text(
                    "Bugün",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              /*
              Container(
                height: 40,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(217, 217, 217, 1)),
                child: const Center(
                  child: Text(
                    "Henüz Başlanmadı",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              */
              const SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Color.fromRGBO(4, 2, 15, 1)),
                  height: 75,
                  width: 400,
                  child: Row(
                    children: [
                      Image.asset("assets/images/logo.png"),
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
                      Expanded(
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("00.00",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("NICKELODEON",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
