import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  static const routeName = '/firstPage';

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  final _aController = TextEditingController();
  final _bController = TextEditingController();
  late String logResult = "";

  List<String> stringArr= ['A', 'B', 'C', 'A', 'A', 'B'];
  List<String> stringArrDouble =[];
  List<String> stringArrTriple =[];

  // String algo1(String strA, String strB){
  //   int c = 0;
  //   int d = 0;
  //
  //   int i=0, j=0;
  //
  //   for(i=0; i<= stringArr.length-1;i++){
  //     String temp= stringArr[i];
  //     for(i=0; i<= stringArr.length-1;i++){
  //
  //     }
  //   }
  //
  //   return ret;
  //   // jawaban no 1 : E; no 2 : C
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 8.0),
          TextField(
            controller: _aController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'input nilai a',
            ),
          ),
          SizedBox(height: 8.0),
          TextField(
            controller: _bController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'input nilai b',
            ),
          ),
          SizedBox(height: 8.0),

          ElevatedButton(
              child: Text("run in log"),
              onPressed: () {
                setState(() {
                  // logResult = algo1(_aController.text, _bController.text);
                });

              }
          ),

          Center(
            child: Text('log : $logResult v'),
          )
        ],
      ),
    );
  }
}
