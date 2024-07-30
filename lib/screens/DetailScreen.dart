import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(4, 2, 30, 1),
      body: Padding(
        padding: const EdgeInsets.only(top: 37, left: 22, right: 22),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 300,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SÜNGERBOB KAREPANTOLON",
                        style: TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              const Center(
                child: const Text(
                  "14 Sezon",
                  style: TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              Center(
                child: SizedBox(
                  width: 320,
                  child: Image.asset("assets/images/spong.png"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromRGBO(253, 155, 8, 1)),
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
                        color: const Color.fromRGBO(4, 2, 31, 1)),
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
              const Divider(
                color: Colors.white,
              ),
              const Text(
                "1999-Mevcut | Fantastik,Aile, Komedi, Çocuk, Animasyon",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 11,
              ),
              const Text(
                "Çizgi film, Büyük Okyanus’un ortasında ve Bikini Adası’nın altında bulunan Bikini Kasabası’nda yaşayan SüngerBob ile arkadaşları Patrick, Squidward, Bay Yengeç, Sandy ve Plankton’un maceralarını konu alır.",
                style: TextStyle(color: Colors.white),
              ),
              const Divider(
                color: Colors.white,
              ),
              const Row(
                children: [
                  Icon(Icons.watch_later_outlined, color: Colors.white),
                  SizedBox(
                    width: 18,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Haftasonu | 17.00",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "10 dakika",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Oyuncular", style: TextStyle(color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 120,
                      width: 90,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/spong.png"),
                            fit: BoxFit.cover),
                      )),
                  Container(
                      height: 120,
                      width: 90,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/spong.png"),
                            fit: BoxFit.cover),
                      )),
                  Container(
                      height: 120,
                      width: 90,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/spong.png"),
                            fit: BoxFit.cover),
                      )),
                  Container(
                      height: 120,
                      width: 90,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/spong.png"),
                            fit: BoxFit.cover),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
