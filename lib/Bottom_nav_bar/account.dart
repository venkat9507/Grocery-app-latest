import 'package:flutter/material.dart';
import 'package:fthdaily/About_Us/About_us.dart';
import 'package:fthdaily/Bottom_nav_bar/wallet.dart';
import 'package:fthdaily/Offers/offers_mainscreen.dart';
import 'package:fthdaily/Support/chat_bot.dart';
import 'package:fthdaily/Transaction_History/transaction_history.dart';
import 'package:fthdaily/coupons.dart';
import 'package:fthdaily/profile/profile.dart';
import 'package:fthdaily/rateus.dart';
import 'package:fthdaily/razorpay/razorpay.dart';


class Accounts extends StatefulWidget {
  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF7653A3)),
      home: Scaffold(
        body: SafeArea(
          child: Account(),
        ),
      ),
    );
  }
}

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Account'),
          leading: IconButton(icon: Icon(Icons.arrow_back_ios,),onPressed: ()=> Navigator.pop(context),),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: size.height * 0.024,
                      color: Color(
                        0xFF7653A3,
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile(),),);
                  },
                  leading: Icon(Icons.person, size: size.height * 0.032),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Wallet',
                    style: TextStyle(
                      fontSize: size.height * 0.024,
                      color: Color(
                        0xFF7653A3,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RazorPay()));
                  },
                  leading:
                      Icon(Icons.account_balance_wallet, size: size.height * 0.032),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Transaction History',
                    style: TextStyle(
                      fontSize: size.height * 0.024,
                      color: Color(
                        0xFF7653A3,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionHistory()));
                  },
                  leading: Icon(Icons.history, size: size.height * 0.032),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Offers',
                    style: TextStyle(
                      fontSize: size.height * 0.024,
                      color: Color(
                        0xFF7653A3,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OffersMainScreen()));
                  },
                  leading: Icon(Icons.local_offer, size: size.height * 0.032),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePageDialogflowV2(),
                      ),
                    );
                  },
                  title: Text(
                    'Support',
                    style: TextStyle(
                      fontSize: size.height * 0.024,
                      color: Color(
                        0xFF7653A3,
                      ),
                    ),
                  ),
                  leading: Icon(Icons.account_circle, size: size.height * 0.032),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Coupons',
                    style: TextStyle(
                      fontSize: size.height * 0.024,
                      color: Color(
                        0xFF7653A3,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CouponsPage(),
                      ),
                    );
                  },
                  leading: Icon(Icons.ac_unit, size: size.height * 0.032),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RateUsPage(),
                      ),
                    );
                  },
                  title: Text(
                    'Rate Us',
                    style: TextStyle(
                      fontSize: size.height * 0.024,
                      color: Color(
                        0xFF7653A3,
                      ),
                    ),
                  ),
                  leading: Icon(Icons.grade, size: size.height * 0.032),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutUs(),
                      ),
                    );
                  },
                  title: Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: size.height * 0.024,
                      color: Color(
                        0xFF7653A3,
                      ),
                    ),
                  ),
                  leading: Icon(
                    Icons.info_rounded,
                    size: size.height * 0.032,
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
