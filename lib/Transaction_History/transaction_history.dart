import 'package:flutter/material.dart';
import 'package:fthdaily/Bottom_nav_bar/wallet.dart';
import 'package:fthdaily/Icons/Icons.dart';
import 'package:fthdaily/Transaction_History/Saving_till_now.dart';
import 'package:fthdaily/Transaction_History/last_month.dart';
import 'package:fthdaily/Transaction_History/this_month_estimation.dart';
import 'package:fthdaily/Transaction_History/wallet_balance.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionHistory extends StatefulWidget {
  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  int currentTab = 0;

  final List<Widget> screens = [
    LastMonth(),
    ThisMonthEstimation(),
    WalletBalance(),
    SavingTillNow(),
  ];

  Widget currentScreen = WalletBalance();

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF7653A3)),
      home: Scaffold(
        appBar: AppBar(
          leading:IconButton(icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },),
          title: Text('Transaction History'),
        ),
        body: PageStorage(bucket: bucket, child: currentScreen),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: currentTab == 4 ? Color(0xFF7653A3) : Colors.grey,
          ),
          backgroundColor: Colors.white,
          onPressed: () {
            setState(() {
              currentScreen = WalletPage();
              currentTab = 4;
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = LastMonth();
                          currentTab = 0;
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.money,
                            color: currentTab == 0
                                ? Color(0xFF7653A3)
                                : Colors.grey,
                          ),
                          Text(
                            'Last Month',
                            style: TextStyle(
                                color: currentTab == 0
                                    ? Color(0xFF7653A3)
                                    : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = ThisMonthEstimation();
                          currentTab = 2;
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.money,
                            color: currentTab == 2
                                ? Color(0xFF7653A3)
                                : Colors.grey,
                          ),
                          Text(
                            'Estimate',
                            style: TextStyle(
                                color: currentTab == 2
                                    ? Color(0xFF7653A3)
                                    : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = WalletBalance();
                          currentTab = 1;
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.money,
                                color: currentTab == 1
                                    ? Color(0xFF7653A3)
                                    : Colors.grey,
                              ),
                            ],
                          ),
                          Text(
                            ' Balance ',
                            style: TextStyle(
                                color: currentTab == 1
                                    ? Color(0xFF7653A3)
                                    : Colors.grey,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = SavingTillNow();
                          currentTab = 3;
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.money,
                            color: currentTab == 3
                                ? Color(0xFF7653A3)
                                : Colors.grey,
                          ),
                          Text(
                            'Savings',
                            style: TextStyle(
                                color: currentTab == 3
                                    ? Color(0xFF7653A3)
                                    : Colors.grey,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
