
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled1/Models/posts_model.dart';
class Services{
  static var client = http.Client();

  static Future loginUser(email)async{
    print("email ${email}");
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/users?email=$email");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      print("results: ${response.body.toString()}");
      var r = jsonDecode(response.body);

      return r;
    }
    else{
      return "error";
    }
  }

  // static Future<List<UserModel>?> fetchUserData(email)async{
  //   Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/users?email=$email");
  //   var response = await client.get(uri);
  //   if (response.statusCode == 200) {
  //     print("results: ${response.body.toString()}");
  //     return userModelFromJson(response.body);
  //   }
  //   else{
  //     return null;
  //   }
  // }

  static List<PostsModel> parseGetPosts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<PostsModel>((json) => PostsModel.fromJson(json))
        .toList();
  }

  static Future<List<PostsModel>> getAllPosts() async {
    Uri uri = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(uri);
    // var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print(response.body.toString());

      return parseGetPosts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}