import 'dart:convert';
import 'dart:developer';
import 'package:air_pay/screen/Navi_screen%20/exchange_screen/api_screen/api_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../Navi_screen /exchange_screen/exchange api/api_model.dart';
import 'data_model.dart';



Future<DataModel?> getSinglePostData() async {

  DataModel? result;
  try {
    final response = await http.get(
      Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"),
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = DataModel.fromJson(item[0]);
    } else {
      print("api is not working");
      print("error");
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}


Future<ExchangeApiModel?> fetchData(String from,String to, String amount, String address, String refundAddress ) async {
  ExchangeApiModel? model;


  try {
    final response = await http.post(Uri.parse('https://api.changenow.io/v1/transactions/f44ec284830b578a5f62f921c510de26f29424c69a873021b13ab945c5eeb270'),body:json.encode({

      "from": "$from",
      "to":"$to",
      "address": "$address",
      "amount": '$amount',
      "extraId": "",
      "userId": "",
      "contactEmail": "",
      "refundAddress": "$refundAddress",
      "refundExtraId": "",
      "rateId": "",

    }));

   // "0x57f31ad4b64095347F87eDB1675566DAfF5EC886"


    if (response.statusCode == 200) {

      final responseData = json.decode(response.body);
      model = ExchangeApiModel.fromJson(responseData);

      print(responseData);
      Fluttertoast.showToast(
          msg: "Next Process",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );


      return model;
    }else if(response.statusCode == 400){
      final responseData = json.decode(response.body);
      print(responseData);

      Fluttertoast.showToast(
          msg: responseData.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );

    } else {

      Fluttertoast.showToast(
          msg: response.statusCode.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

  }catch(e){
    print (e);
    throw e;
  }
  return model;
}





Future<ExchApiModel?> fetchExchangeData(String amount,String fromCrypto,String toCrypto) async {
  ExchApiModel? modelExchange;


  try {
    final responseget = await http.get(Uri.parse('https://api.changenow.io/v1/exchange-amount/$amount/${fromCrypto}_${toCrypto}?api_key=f44ec284830b578a5f62f921c510de26f29424c69a873021b13ab945c5eeb270'));



    if (responseget.statusCode == 200) {
      final responseApi = json.decode(responseget.body);
      modelExchange = ExchApiModel.fromJson(responseApi);
      print(responseApi);

      // Fluttertoast.showToast(
      //     msg: "Next Process",
      //     toastLength: Toast.LENGTH_LONG,
      //     gravity: ToastGravity.SNACKBAR,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Color(0xFF1E272E),
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );

     // return modelExchange;

    }else if(responseget.statusCode==400){
     // final responseApi = json.decode(responseget.body) ;

      Fluttertoast.showToast(
          msg: "Enter send amount and select Crypto",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );


    } else {

      Fluttertoast.showToast(
          msg: responseget.statusCode.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

  }catch(e){
    print (e);
    throw e;
  }
  return modelExchange;
}

// Future<TransactionStatus?> transactionApiModel() async{
//
//   var headers = {
//     'x-changenow-api-key': 'f44ec284830b578a5f62f921c510de26f29424c69a873021b13ab945c5eeb270'
//   };
//   var request = http.Request('GET', Uri.parse('https://api.changenow.io/v2/exchange/by-id?id=bc0fdcf6ee0efa'));
//
//   request.headers.addAll(headers);
//
//   http.StreamedResponse response = await request.send();
//
//   if (response.statusCode == 200) {
//     print(await response.stream.bytesToString());
//   }
//   else {
//     print(response.reasonPhrase);
//   }
//
//
// }