// import 'package:flutter/material.dart';
// import 'package:fthdaily/account.dart';
// import 'package:fthdaily/cart.dart';
// import 'package:fthdaily/completeprofile.dart';
// import 'package:fthdaily/coupons.dart';
// import 'package:fthdaily/Bottom_nav_bar/store.dart';
// import 'package:fthdaily/location/location.dart';
// import 'package:fthdaily/location/locationenter.dart';
// import 'package:fthdaily/rateus.dart';
// import 'package:fthdaily/Bottom_nav_bar/wallet.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Color(0xFF7653A3),
//         accentColor: Color(0xFF7653A3),
//         iconTheme:
//             Theme.of(context).iconTheme.copyWith(color: Color(0xFF9B63DC)),
//         textTheme:
//             Theme.of(context).textTheme.apply(bodyColor: Color(0xFF707070)),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(),
//     );
//   }
// }
import 'package:animated_button/animated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fthdaily/About_Us/About_us.dart';
import 'package:fthdaily/Bottom_nav_bar/stores.dart';
import 'package:fthdaily/Icons/Icons.dart';
import 'package:fthdaily/Bottom_nav_bar/Account.dart';
import 'package:fthdaily/Bottom_nav_bar/delivery_status.dart';
import 'package:fthdaily/Bottom_nav_bar/plans.dart';
import 'package:fthdaily/Bottom_nav_bar/store.dart';
import 'package:fthdaily/Bottom_nav_bar/wallet.dart';
import 'package:fthdaily/Offers/Offers.dart';
import 'package:fthdaily/Offers/offers_mainscreen.dart';
import 'package:fthdaily/Sign%20In%20&%20log%20in/login/loginphone.dart';
import 'package:fthdaily/Sign%20In%20&%20log%20in/login/phoneauth.dart';
import 'package:fthdaily/Sign%20In%20&%20log%20in/loginpage.dart';
import 'package:fthdaily/Support/chat_bot.dart';
import 'package:fthdaily/Transaction_History/transaction_history.dart';
import 'package:fthdaily/Transaction_History/wallet_balance.dart';
import 'package:fthdaily/Vegetables/vegetables.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fthdaily/grocery-store/Grocery_Store_home.dart';
import 'package:fthdaily/grocery-store/grocery_provider.dart';
import 'package:fthdaily/grocery-store/grocery_store_bloc.dart';
import 'package:fthdaily/grocery-store/grocery_store_list.dart';
import 'package:fthdaily/profile/profile.dart';
import 'package:fthdaily/razorpay/razorpay.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'grocery-store/Streambuilder.dart';
import 'grocery-store/cart demo.dart';
import 'grocery-store/grocery_store_products.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GroceryStoreBloc().getdata().whenComplete(() =>
      runApp(MyApps(),),
  );

}
class MyApps extends StatefulWidget {


  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  List cart = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StreamingData();
    getDataCartList();

  }


  getDataCartList()async{
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    // cart = prefs.getStringList('cartData');
  }




  final bloc = GroceryStoreBloc();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GroceryProvider(
      bloc: bloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Color(0xFF7653A3)),
        initialRoute: 'MyApp',
        routes: {
          'LoginPhone' : (context) => LoginPhone(),
          'MyApp' : (context) => MyApp(),
          'PhoneAuth' : (context) => PhoneAuth(),
          'Login' : (context) => loginPage(),
          '/MyApps' : (context) => MyApps(),
          'Profile' : (context) => Profile(),
          'Welcome' : (context)=> WelcomePage(),
          'Edit' : (context)=> Edit(),
          'Pay' : (context)=> RazorPay(),
          'Gro' : (context)=> GroceryStoreHome(),
          'stream' : (context) => StreamingData(),
          'list' : (context)=> GroceryStoreCartDemo(),
        },
        home:MyApp(),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentTab = 0;

  final List<Widget> screens = [
    Store(),
    Plans(),
    WalletPage(),
    Account(),
    DeliveryStatus(),
  ];

  Widget currentScreen = Store();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Color(0xFF7653A3)),
        home: Scaffold(
            body: PageStorage(bucket: bucket, child: currentScreen),
            floatingActionButton: FloatingActionButton(
              child: Image.asset('images/truck.png',height: MediaQuery.of(context).size.height*0.03,color: currentTab == 4 ? Color(0xFF7653A3) : Colors.grey,),
              backgroundColor: Colors.white,
              onPressed: () {
                setState(() {
                  currentScreen = DeliveryStatus();
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
                              currentScreen = Store();
                              currentTab = 0;
                            });
                          },
                          minWidth: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.store,
                                color: currentTab == 0
                                    ? Color(0xFF7653A3)
                                    : Colors.grey,
                              ),
                              Text(
                                'Store',
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
                              currentScreen = Plans();
                              currentTab = 1;
                            });
                          },
                          minWidth: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.event_note_outlined,
                                color: currentTab == 1
                                    ? Color(0xFF7653A3)
                                    : Colors.grey,
                              ),
                              Text(
                                'Plans',
                                style: TextStyle(
                                    color: currentTab == 1
                                        ? Color(0xFF7653A3)
                                        : Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              currentScreen = WalletPage();
                              currentTab = 2;
                            });
                          },
                          minWidth: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.account_balance_wallet,
                                color: currentTab == 2
                                    ? Color(0xFF7653A3)
                                    : Colors.grey,
                              ),
                              Text(
                                'Wallet',
                                style: TextStyle(
                                    color: currentTab == 2
                                        ? Color(0xFF7653A3)
                                        : Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              currentScreen = Account();
                              currentTab = 3;
                            });
                          },
                          minWidth: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.supervisor_account_outlined,
                                color: currentTab == 3
                                    ? Color(0xFF7653A3)
                                    : Colors.grey,
                              ),
                              Text(
                                'Account',
                                style: TextStyle(
                                    color: currentTab == 3
                                        ? Color(0xFF7653A3)
                                        : Colors.grey),
                              ),
                            ],
                          ),
                        )
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

