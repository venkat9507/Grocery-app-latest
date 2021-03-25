

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fluttertoast/fluttertoast.dart';


class RazorPay extends StatefulWidget {
  @override
  _RazorPayState createState() => _RazorPayState();
}

class _RazorPayState extends State<RazorPay> {
  static const platform = const MethodChannel("razorpay_flutter");

  Razorpay _razorpay;
  TextEditingController textEditingController = TextEditingController();
  int textfield = 0;

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
      appBar: AppBar(
        title: Text('RazorPay'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40),
            child: AnimatedSwitcher(
              duration: Duration(seconds: 2),
              child: TweenAnimationBuilder(
                tween: Tween(begin: 1.0,end: 0.0),
                curve: Curves.easeInOutCubic,
                duration: Duration(seconds: 2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: textEditingController,

                    onTap: (){
                      print(textEditingController);
                    },
                    onChanged: (status){
                      print(status);
                      textfield = num.parse(status);
                      print(textfield);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32),
                        ),
                      ),
                      hintText: 'Amount to pay',
                    ),
                  ),
                ),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(value * 500, 0.0),
                    child: child,
                  );
                },
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween:  Tween(begin: 1.0, end: 0.0),
            curve: Curves.easeInOutQuint,
            duration: Duration(seconds: 1),
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
                child: Text('Pay Now ',style: TextStyle(color: Colors.white),),
                onPressed: ()=> openCheckout(),),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(value * 500, 0.0),
                child: child,
              );
            },
          )
        ],
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_IPEaGahzToPYnV',
      'amount': textfield * 100,
      'name': 'Digi Mart',
      'description': 'Payment for Product Purchased',
      'prefill': {'contact': '1234567890', 'email': 'venkatraman230@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIosWeb: 10);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIosWeb: 10);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 10);
  }
}