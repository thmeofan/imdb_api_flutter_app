import 'dart:convert' as convert;
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/consts/api_consts.dart';
import 'package:store_api_flutter_course/models/movie_full_info_model.dart';
import 'package:store_api_flutter_course/models/movie_part_info_model.dart';

class APIHandler {
  static Future<List<MoviePartInfoModel>> getData(
      {required String request, }) async {
    late Map jsonResponse;
    List<MoviePartInfoModel> shortInfoList = [];
    try {
      var url = Uri.parse(
          'https://api.collectapi.com/imdb/imdbSearchByName?query=$request');
      var response = await http.get(url, headers: {
        'authorization': 'apikey 1yqVSiaXTu4i9IyXB5rz2F:7s3X9ZDJdATmbkmYoRexj3',
        'content-type': 'application/json'
      });

      if (response.statusCode == 200) {
        jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception("An error occurred");
      }
      if (jsonResponse["result"]!= ""){

      for (var shortInfo in jsonResponse['result']) {
        MoviePartInfoModel shortInfoModel =
            MoviePartInfoModel.fromJson(shortInfo);
        shortInfoList.add(shortInfoModel);
      }
      for (int i = 0; i < shortInfoList.length; i++) {
        print('${i + 1}. ${shortInfoList[i]}');
      }}
    } catch (error) {
      log("An error occurred $error");
       rethrow;
    }
    return shortInfoList;
  }

  // static Future<List<MovieFullInfoModel>> getAllProducts(
  //     {required String limit}) async {
  //   List shortInfoList = await getData(
  //     limit: limit,
  //     request: '',
  //
  //   );
  //   return MoviePartInfoModel.fromJson;
  // }

  // static Future<List<MoviePartInfoModel>> getAllCategories() async {
  //   List shortInfoList = await getData();
  //   return MoviePartInfoModel.categoriesFromSnapshot(temp);
  // }
  static Future<MovieFullInfoModel> getMovieInfoById(
      {required String id}) async {
    try {
      late Map<String, dynamic> jsonResponse1;
      var url1 = Uri.parse(
          'https://api.collectapi.com/imdb/imdbSearchById?movieId=$id');
      var response1 = await http.get(url1, headers: {
        'authorization': 'apikey 1yqVSiaXTu4i9IyXB5rz2F:7s3X9ZDJdATmbkmYoRexj3',
        'content-type': 'application/json'
      });
      if (response1.statusCode == 200) {
        jsonResponse1 =
            convert.jsonDecode(response1.body) as Map<String, dynamic>;
        MovieFullInfoModel fullInfoModel =
            MovieFullInfoModel.fromJson(jsonResponse1['result']);

        return fullInfoModel;
      } else {
        throw Exception("");
      }
    } catch (error) {
      log("an error occurred while getting movie info $error");
      throw error.toString();
    }
  }
}
