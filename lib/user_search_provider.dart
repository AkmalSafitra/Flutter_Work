import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_work/user.dart';

import 'api_service.dart';

enum ResultState{Loading, NoData, HasData, Error}

class UserSearchProvider extends ChangeNotifier{
  final ApiService apiService;

  UserSearchProvider({required this.apiService}) {
    _fetchSearchUser();
  }

  late UserSearchResult _userSearchResult;
  String _message = '';
  late ResultState _state;

  String get message => _message;
  UserSearchResult get result => _userSearchResult;
  ResultState get state => _state;

  Future<dynamic> _fetchSearchUser() async{
    try{
      _state = ResultState.Loading;
      notifyListeners();
      final user = await apiService.apiUserSearch();

      if(user.items.isEmpty){
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Restaurant Not Found';
      }else{
        _state = ResultState.HasData;
        notifyListeners();
        return _userSearchResult = user;
      }
    }catch(e){
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}


