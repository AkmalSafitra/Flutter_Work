import 'package:flutter/material.dart';
import 'package:flutter_work/user.dart';
import 'package:flutter_work/user_search_provider.dart';
import 'package:provider/provider.dart';

import 'api_service.dart';
import 'card_user.dart';

class UserPage extends StatefulWidget {

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  late Future<UserSearchResult> _userSearch;

  @override
  void initState() {
    super.initState();
    _userSearch = ApiService(query: 'blank').apiUserSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserSearchProvider>(

        builder: (context, state, _){
          if(state.state == ResultState.Loading){
            return Center(child: CircularProgressIndicator());
          } else if(state.state == ResultState.HasData){
            return Scrollbar(
              isAlwaysShown: true,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.result.items.length,
                itemBuilder: (context, index){
                  var restaurant = state.result.items[index];
                  return CardUser(userItem: restaurant);
                },
              ),
            );
          } else if (state.state == ResultState.NoData) {
            return Center(child: Text(state.message));
          } else if (state.state == ResultState.Error) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text("Failed to load Data"),
                    Text("Please check your Internet connection"),
                  ]
              ),
            );
          } else {
            return Center(child: Text(''));
          }
        }

    );
  }
}
