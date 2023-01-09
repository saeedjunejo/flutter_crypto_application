import 'package:air_pay/screen/Navi_screen%20/transcation_screen/api_model.dart';
import 'package:air_pay/screen/wallet_screen/deposit_crypto/deposit_apiModel.dart';
import 'package:flutter/cupertino.dart';
import '../Navi_screen /exchange_screen/api_screen/api_model.dart';
import '../Navi_screen /exchange_screen/exchange api/api_model.dart';
import '../Navi_screen /transcation_screen/http_request.dart';
import '../wallet_screen/wallet_apiModel/wallet_http.dart';
import 'data_model.dart';
import 'http.dart';



class DataClass extends ChangeNotifier {


  DataModel? post;
  ExchangeApiModel? exchangePost;
  ExchApiModel? exchApiModel;
  DepositCrypto? depositApiModel;
  TransactionStatus? transactionStatus;


  bool loading = false;

  getPostData() async {
    loading = true;
    post = (await getSinglePostData());
    loading = false;
    notifyListeners();
  }



  getExchangeData(String from,String to,String amount,String address,String refundAddress) async {

    exchangePost = (await fetchData(from,to,amount,address,refundAddress));
    notifyListeners();

  }

  getAirData(String amount,String fromCrypto,String toCrypto) async{

    exchApiModel=(await fetchExchangeData(amount,fromCrypto,toCrypto));
    notifyListeners();
  }


  getDepositData(String fromDeposit,String toDeposit,String amountDeposit,String addressDeposit,String refundAddressDeposit) async{
    depositApiModel=(await apiFetch(fromDeposit,toDeposit,amountDeposit,addressDeposit,refundAddressDeposit));
    notifyListeners();
  }

  getTransaction(String statusID)async{
    transactionStatus=(await transactionApiModel(statusID));
    notifyListeners();
  }


}