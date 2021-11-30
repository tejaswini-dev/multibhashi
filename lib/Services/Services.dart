import 'dart:convert';

import 'package:flutter_app_multibashi/DataModel/ArtWorkDetailPage.dart';
import 'package:flutter_app_multibashi/DataModel/ArtWorkDetails.dart';
import 'package:flutter_app_multibashi/DataModel/ArtWorksDataModel.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<ArtWorksDataModel> fetchArtWorkData({String searchKeyValue}) async {
    final response = await http.get(
      Uri.parse(
          'https://api.artic.edu/api/v1/artworks/search?q=$searchKeyValue'),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ArtWorksDataModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<ArtWorksDetail> fetchArtWorkDetailedData({int page}) async {
    final response = await http.get(
      Uri.parse('https://api.artic.edu/api/v1/artworks?page=$page'),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ArtWorksDetail.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<ArtWorksDetailedPage> fetchArtWorkDetailedPageData({int id}) async {
    final response = await http.get(
      Uri.parse('https://api.artic.edu/api/v1/artworks/$id'),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ArtWorksDetailedPage.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
