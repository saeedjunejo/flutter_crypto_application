import 'dart:convert';
import 'dart:ui';

import 'package:air_pay/screen/wallet_screen/deposit_crypto/deposit_apiModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

Future<DepositCrypto?> apiFetch(String fromDeposit,String toDeposit, String amountDeposit, String addressDeposit, String refundAddDeposit ) async{
  DepositCrypto? depositCrypto;
try {
  final response = await http.post(Uri.parse('https://api.changenow.io/v2/exchange'), headers: {
    'Content-Type': 'application/json',
    'x-changenow-api-key': 'f44ec284830b578a5f62f921c510de26f29424c69a873021b13ab945c5eeb270'
  }, body: json.encode({

    "fromCurrency": "btc",
    "toCurrency": "usdt",
    "fromNetwork": "$fromDeposit",
    "toNetwork": "$toDeposit",
    "fromAmount": "$amountDeposit",
    "toAmount": "",
    "address": "$addressDeposit",
    "extraId": "",
    "refundAddress": "$refundAddDeposit",
    "refundExtraId": "",
    "userId": "",
    "payload": "",
    "contactEmail": "",
    "source": "",
    "flow": "standard",
    "type": "direct",
    "rateId": ""
  }));

  if (response.statusCode == 200) {
    final responseDeposit = json.decode(response.body);
    depositCrypto = DepositCrypto.fromJson(responseDeposit);
    print(responseDeposit);
  }
  else if (response.statusCode == 400 || response.statusCode == 401) {
    final responseDeposit = json.decode(response.body);

    Fluttertoast.showToast(
        msg: responseDeposit,
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
return depositCrypto;
}