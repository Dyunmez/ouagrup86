import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oua_bootcamp/models/ApiModel.dart';
import 'package:oua_bootcamp/screens/DetailScreen.dart';
import 'package:oua_bootcamp/screens/ProfileEditScreen.dart';

class TvSeriesScreen extends StatefulWidget {
  const TvSeriesScreen({super.key});

  @override
  State<TvSeriesScreen> createState() => _TvSeriesScreenState();
}

class _TvSeriesScreenState extends State<TvSeriesScreen> {
  Future<ApiModel> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://www.omdbapi.com/?s=harry&apikey=a43e50a0'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ApiModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  final List<bool> _isFavorited = List.generate(100, (index) => false);

  void _toggleFavorite(int index) {
    setState(() {
      _isFavorited[index] = !_isFavorited[index];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                        "Diziler ve Filmler",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const EditProfileScreen()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromRGBO(253, 155, 8, 1)),
                      height: 36,
                      width: 139,
                      child: const Center(
                        child: Text(
                          "Hesabım",
                          style: TextStyle(color: Colors.white),
                        ),
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
              SizedBox(
                width: MediaQuery.of(context).size.width - 66,
                height: 600,
                child: FutureBuilder<ApiModel>(
                  future: fetchAlbum(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // Render the list of films using the data from the API
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data?.search?.length ?? 0,
                        itemBuilder: (context, index) {
                          final icerik = snapshot.data!.search![index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailScreen(id: icerik.imdbId ?? ""),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: Color.fromRGBO(4, 3, 15, 1)),
                                    height: 75,
                                    width: 400,
                                    child: Row(
                                      children: [
                                        Image.network(icerik.poster ?? "",
                                            fit: BoxFit.cover),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              icerik.title ?? "",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(icerik.year.toString() ?? "",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            //Text("The Dirty Bubble Bass!", style: TextStyle(color: Colors.white)),
                                          ],
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(icerik.year.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  _isFavorited[index]
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color: _isFavorited[index]
                                                      ? Colors.red
                                                      : null,
                                                ),
                                                onPressed: () =>
                                                    _toggleFavorite(index),
                                                tooltip: _isFavorited[index]
                                                    ? 'Favorilerden Çıkar'
                                                    : 'Favorilere Ekle',
                                              )
                                              //Text("NICKELODEON", style: TextStyle(color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    )),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          );
                        },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
