import 'dart:convert';
import 'package:flutter_work/user.dart';
import 'package:http/http.dart' as http;


class ApiService{
  static final String _baseUrl = 'https://api.github.com/users/';
  final String id;
  final String query;

  ApiService({this.id = '', this.query=''});

  Future<UserSearchResult> apiUserSearch() async{
    final response = await http.get(Uri.parse(_baseUrl+query));

    if(response.statusCode == 200){
      return UserSearchResult.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load User Search');
    }
  }

}