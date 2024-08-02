import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oua_bootcamp/models/ImdbModel.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget {
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Future<Imdb> fetchData() async {
    final response = await http.get(
        Uri.parse('https://www.omdbapi.com/?i=${widget.id}&apikey=a43e50a0'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Imdb.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(4, 2, 30, 1),
      body: Padding(
          padding: const EdgeInsets.only(top: 37, left: 22, right: 22),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 66,
            height: MediaQuery.of(context).size.height - 74,
            child: FutureBuilder<Imdb>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Imdb film = snapshot.data!;
                  // Render the list of films using the data from the API
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Text(
                                  film.title!,
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 50,
                                )
                                /* 
,
                                Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                )
                                */
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Text(
                            film.year!,
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: SizedBox(
                            width: 320,
                            child: Image.network(
                              film.poster!,
                              height: 290,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            /*
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
                          
                        */
                          ],
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Text(
                          "${film.year!}-Mevcut | ${film.genre!}",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        Text(
                          film.plot!,
                          style: TextStyle(color: Colors.white),
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.white),
                            SizedBox(
                              width: 18,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${film.imdbRating} / 10",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "Ödüller: ${film.awards}",
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
                        ), /*
                        const Text("Oyuncular",
                            style: TextStyle(color: Colors.white)),
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
                                      image:
                                          AssetImage("assets/images/spong.png"),
                                      fit: BoxFit.cover),
                                )),
                          ],
                        )*/
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  // Render an error message if there was an error fetching the data
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Render a loading spinner while waiting for the data to load
                  return CircularProgressIndicator();
                }
              },
            ),
          )),
    );
  }
}
