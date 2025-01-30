import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_getmethod_practice/data/model/posts_page.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  Future<List<Posts>> fetchPosts() async {
    final response = await http.get(Uri.parse('$_baseUrl/posts'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((postJson) => Posts.fromJson(postJson)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
