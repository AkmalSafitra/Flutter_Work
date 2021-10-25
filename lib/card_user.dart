import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_work/user.dart';
import 'package:flutter_work/user_search_provider.dart';
import 'package:provider/provider.dart';

class CardUser extends StatefulWidget {
  final Item userItem;

  const CardUser({required this.userItem});

  @override
  State<CardUser> createState() => _CardUserState();
}

class _CardUserState extends State<CardUser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: widget.userItem.login,
          child: Image.network(
              widget.userItem.avatarUrl,
              width: 100),
        ),
        title: Text(widget.userItem.login),
        // subtitle: Text(widget.restaurant.city),
        // onTap: () => Navigator.pushNamed(
        //         context, RestaurantDetailPage.routeName,
        //         arguments: widget.restaurant.id)
        //     .then((value) => setState(() {
        //           context.read<DatabaseProvider>().getBookmarks();
        //         })),
      ),
    );
  }
}
