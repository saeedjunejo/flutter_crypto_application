import 'package:air_pay/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../utils/components.dart';
import '../../api_model/data_get.dart';

class CheckTransStatus extends StatefulWidget {
  const CheckTransStatus({Key? key}) : super(key: key);

  @override
  State<CheckTransStatus> createState() => _CheckTransStatusState();
}

class _CheckTransStatusState extends State<CheckTransStatus> {


  @override
  void initState() {
    setState(() {
      //final fetchDepModel = Provider.of<DataClass>(context, listen: false);
      //fetchDepModel.getTransaction();

    });
    super.initState();
  }
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final fetchTransaction = Provider.of<DataClass>(context);
    return Scaffold(

      backgroundColor: customBlack,
      body: SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              InkWell(
                onTap: (){
                  Navigator.pop(context);

                },
                child: Container(
                  width: 35,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                      color: Color(0xFF0c0c0c)
                  ),
                  child: Icon(Icons.arrow_back,color: Colors.white),
                ),
              ),
              Center(child: Text("Transaction Status",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))),
              SizedBox(height: 30),
              CustomEdited(
                width: Get.width,
                height: Get.height*0.085,
                hintText: 'Enter your transactions id',
                controller: search,
              ),
              SizedBox(height: 30),
              Center(
                child: CustomButton(
                  height: Get.height * 0.06,
                  width: Get.width,
                  text: 'Check Transaction Status',
                  fontSize: Get.height * 0.020,
                  onPressed: () {

                    if(search.text.isEmpty){
                      Fluttertoast.showToast(
                              msg: "Enter Status ID",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.SNACKBAR,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color(0xFF1E272E),
                              textColor: Colors.white,
                              fontSize: 16.0
                          );

                    }

                    fetchTransaction.getTransaction(search.text.toString());
                  //  print(fetchTransaction.getTransaction(search.text.toString()));
                    //print(fetchTransaction);
                    // if(search.text.isEmpty){
                    //   Fluttertoast.showToast(
                    //       msg: "Enter Status ID",
                    //       toastLength: Toast.LENGTH_SHORT,
                    //       gravity: ToastGravity.SNACKBAR,
                    //       timeInSecForIosWeb: 1,
                    //       backgroundColor: Color(0xFF1E272E),
                    //       textColor: Colors.white,
                    //       fontSize: 16.0
                    //   );
                    // }
                    // else(){
                    //
                    //   setState(() {
                    //     fetchTransaction.getTransaction(search.text.toString());
                    //     print(fetchTransaction.getTransaction(search.text.toString()));
                    //   });


                   // }
                    //Get.to(() => CheckTransStatus());
                  },
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: Get.width,
                height: Get.height,
                color: Color(0xFF0c0c0c),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(fetchTransaction.transactionStatus?.status.toString()?? "",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),

                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(fetchTransaction.transactionStatus?.createdAt.toString()?? "",style: TextStyle(color: Colors.white38,fontSize: 13,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                          Text(fetchTransaction.transactionStatus?.id.toString()?? "",style: TextStyle(color: Colors.white38,fontSize: 13,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                        ],
                      ),

                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(fetchTransaction.transactionStatus?.fromNetwork.toString().toUpperCase() ?? "",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                          Text(fetchTransaction.transactionStatus?.toNetwork.toString().toUpperCase() ?? "",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),

                        ],
                      ),

                      SizedBox(height: 25),
                      Text(fetchTransaction.transactionStatus?.payinAddress.toString()?? "",style: TextStyle(color: Colors.white,fontSize: 19,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),

                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(fetchTransaction.transactionStatus?.expectedAmountFrom.toString().toUpperCase() ?? "",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                          Text(fetchTransaction.transactionStatus?.expectedAmountTo.toString().toUpperCase() ?? "",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),

                        ],
                      ),

                      SizedBox(height: 25),
                      Text(fetchTransaction.transactionStatus?.payoutAddress.toString()?? "",style: TextStyle(color: Colors.white,fontSize: 19,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),

                      SizedBox(height: 20),
                      Text(fetchTransaction.transactionStatus?.depositReceivedAt.toString().toUpperCase() ?? "",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),

                      SizedBox(height: 20),
                      Text(fetchTransaction.transactionStatus?.refundAddress.toString().toUpperCase() ?? "",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),

                      SizedBox(height: 20),

                    ],
                  ),
                ),



              )

            ],
          ),
        ),
      )



    );
  }


}
