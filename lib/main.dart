import 'package:flutter/material.dart';
import 'package:flutter_work/first_page.dart';
import 'package:flutter_work/user_search_page.dart';
import 'package:flutter_work/user_search_provider.dart';
import 'package:provider/provider.dart';

import 'api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
      routes: {
        FirstPage.routeName: (context) => FirstPage(),
      },
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserSearchProvider(apiService: ApiService()),
        ),
      ],
      child: UserPage(),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("FLUTTER TEST"),
    //   ),
    //   body: Center(
    //     child: Column(
    //       children: [
    //
    //         ElevatedButton(
    //           child: Text("Algoritma 1"),
    //           onPressed: () {
    //             Navigator.pushNamed(context, FirstPage.routeName);
    //           },
    //         ),
    //
    //         ElevatedButton(
    //           child: Text("Algoritma 1"),
    //           onPressed: () {
    //             Navigator.pushNamed(context, FirstPage.routeName);
    //           },
    //         ),
    //
    //       ],
    //     ),
    //   ),
    // );
  }
}
