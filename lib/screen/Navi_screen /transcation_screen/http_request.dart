
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;

import 'api_model.dart';

Future<TransactionStatus?> transactionApiModel(String statusId) async{

  TransactionStatus? transactionStatus;



  try{

    final response= await http.get(Uri.parse("https://api.changenow.io/v2/exchange/by-id?id=$statusId"),headers: {
      'x-changenow-api-key': 'f44ec284830b578a5f62f921c510de26f29424c69a873021b13ab945c5eeb270'

    });
    if(response.statusCode==200){
      final responseTransaction = json.decode(response.body);
      transactionStatus = TransactionStatus.fromJson(responseTransaction);
      print(responseTransaction);
    }
    else if (response.statusCode == 400 || response.statusCode == 401) {
      final responseTransaction = json.decode(response.body);

      Fluttertoast.showToast(
          msg: responseTransaction,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else {
      print(response.reasonPhrase);
    }

  }catch(e){
    print (e);
    throw e;
  }

  return transactionStatus;
}