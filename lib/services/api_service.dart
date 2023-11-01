import 'dart:convert';
import '../model/news_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<NewsModel?> fetchNews({required String category}) async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=8e311eaa87174fff997bc0f2ac90bce7');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel posts = NewsModel.fromJson(json.decode(res.body));
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<NewsModel?> fetchImages() async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=8e311eaa87174fff997bc0f2ac90bce7');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel posts = NewsModel.fromJson(json.decode(res.body));
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }

  Future<NewsModel?> searchNews({required String query}) async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&q=$query&apiKey=8e311eaa87174fff997bc0f2ac90bce7');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel posts = NewsModel.fromJson(json.decode(res.body));
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
