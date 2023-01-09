import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class ApiTest extends StatefulWidget {
  const ApiTest({Key? key}) : super(key: key);

  @override
  State<ApiTest> createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {

  Future<dynamic> apiFetch() async{

    var headers = {
      'x-changenow-api-key': 'f44ec284830b578a5f62f921c510de26f29424c69a873021b13ab945c5eeb270'
    };
    var request = http.Request('GET', Uri.parse('https://api.changenow.io/v2/exchange/by-id?id=bc0fdcf6ee0efa'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }


  }


@override
  void initState() {
    // TODO: implement initState
    apiFetch();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

        ],
      ),
    );
  }
}


