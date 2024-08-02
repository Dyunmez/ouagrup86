// To parse this JSON data, do
//
//     final apiModel = apiModelFromJson(jsonString);

import 'dart:convert';

ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

String apiModelToJson(ApiModel data) => json.encode(data.toJson());

class ApiModel {
  List<Search>? search;
  String? totalResults;
  String? response;

  ApiModel({
    this.search,
    this.totalResults,
    this.response,
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        search: json["Search"] == null
            ? []
            : List<Search>.from(json["Search"]!.map((x) => Search.fromJson(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
      );

  Map<String, dynamic> toJson() => {
        "Search": search == null
            ? []
            : List<dynamic>.from(search!.map((x) => x.toJson())),
        "totalResults": totalResults,
        "Response": response,
      };
}

class Search {
  String? title;
  String? year;
  String? imdbId;
  String? type;
  String? poster;

  Search({
    this.title,
    this.year,
    this.imdbId,
    this.type,
    this.poster,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: json["Type"],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": type,
        "Poster": poster,
      };
}
