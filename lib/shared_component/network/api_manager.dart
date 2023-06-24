import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_cycle8_sat/model/articl_model.dart';
import 'package:news_app_cycle8_sat/model/source_model.dart';
import 'package:news_app_cycle8_sat/shared_component/constants/constants.dart';

class ApiManager {
  static Future<SourceModel> fetchSources(String category) async {
    var query = {
      "apiKey": Constants.apiKey,
      "category": category,
    };

    // final response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=bd31c68e9be54c3f91ea553ef840d507&category=sports"));
    final response = await http.get(
      Uri.https(
        Constants.baseURL,
        "/v2/top-headlines/sources",
        query,
      ),
    );

    var sourceData = SourceModel.fromJson(jsonDecode(response.body));

    debugPrint(response.body);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)["status"] == "ok") {
      return sourceData;
    } else {
      throw Exception("Failed to Load soures");
    }
  }

  static Future<ArticlModel> fetchNewsList(String source) async {
    var query = {
      "apiKey": Constants.apiKey,
      "sources": source,
    };

    var uri = Uri.https(
      Constants.baseURL,
      "/v2/everything",
      query,
    );
    final response = await http.get(uri);

    if(response.statusCode == 200 && jsonDecode(response.body)["status"] == "ok") {
      var articls = ArticlModel.fromJson(jsonDecode(response.body));
      return articls;
    } else {
      throw Exception("Failed to load articls");
    }
  }
}
