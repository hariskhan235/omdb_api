import 'dart:convert';

import 'package:http/http.dart' as http;

class OmdbApiService {
  Future getMoviesData(String movieName) async {
    var data;
    final response = await http
        .get(Uri.parse('https://www.omdbapi.com/?t=$movieName&apikey=6302aef1'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error Occured');
    }
  }
}
