import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fthdaily/Sign In & log in/login/phoneauth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fthdaily/main.dart';
import 'package:fthdaily/Sign In & log in/registerscreen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
 final  _auth = FirebaseAuth.instance;
 FirebaseUser loggedInUser;
 final firestore = Firestore.instance;
 String emailId;
 String phoneNo;
 bool phoneORemail ;
 var scaffoldkey = GlobalKey<ScaffoldState>();
 var namekey =GlobalKey<FormState>();
 var emailkey =GlobalKey<FormState>();
 @override
 void initState() {
   // TODO: implement initState
   super.initState();
   getCurrentUser();
 }

 getCurrentUser() async {
   final user = await _auth.currentUser;
   try {
     if (user != null) {
       if(user.email != null){
         Text(user.email);
         emailId = user.email;
         print(emailId);
         setState(() {
           phoneORemail = true;
           print(phoneORemail);
         });
       }
       else
         {
           if(user.phoneNumber !=null){
             Text(user.phoneNumber);
             phoneNo = user.phoneNumber;
             print(phoneNo);
             setState(() {
               phoneORemail =false;
               print(phoneORemail);
             });
           }
           else
             {
               Text('Hi User');
             }
         }
     }
   } catch (e) {
     print(e);
   }
 }

 Future<void> _signOut() async {
   await _auth..signOut();

 }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context)),
            title: Text('Profile'),
            actions: [
              FlatButton(onPressed: (){
                setState(() {
                  _signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
                });
                print(_auth.signOut());
              }, child: Text('Logout',style: TextStyle(color: Colors.white),))
            ],
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        color: Theme.of(context).primaryColor,
                          onPressed: () {
                          setState(() {
                            print('tapped');
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Edit(),),);


                          });
                          },
                          child: Text('Edit',style: TextStyle(color: Colors.white),)
    ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                   Center(
                     child: Column(
                       children: [
                         // phoneORemail ==true ? Text(emailId ,style: TextStyle(fontSize: 30),): Text(phoneNo),


                       ],
                     ),
                   )
                  ],
                ),
              ],
            ),
          )),

    );
  }
}


class Edit extends StatefulWidget {
  final email;
  final password;
  Edit({this.email,this.password});
  @override
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  String name;
  String email;
  String Gender;
  String vegetarian;
  bool checkedValue = false;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var namekey =GlobalKey<FormState>();
  var emailkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:(){
            Navigator.pop(context);
          }),
          title: Text('Complete Profile'),
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context,int index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text:  'Name',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.black),
                            children:
                            [
                              TextSpan(
                                text:' *',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16.0),
                              ),                                           ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Form(
                          key: namekey,
                          child: TextFormField(
                              validator: (String value){
                                if(value.length < 4)
                                  return " Enter at least 3 letter of your name";
                                else
                                  return null;
                              },
                              controller: nameController,
                              onChanged: (value) {
                                name  = value;

                              },

                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(32),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  hintText: 'name',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF87837e),
                                  ),
                                  suffixIcon: Icon(Icons.account_circle),
                                  hoverColor: Colors.yellow,
                                  filled: true,
                                  focusColor: Colors.yellow),
                              style: TextStyle(color: Colors.black)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text:  'Email',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.black),
                            children:
                            [
                              TextSpan(
                                text:' *',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16.0),
                              ),                                           ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Form(
                          key: emailkey,
                          child: TextFormField(
                              validator: (String value){
                                if(value.length < 5)
                                  return " Enter at least 8 character from your email";
                                else
                                  return null;
                              },
                              controller: emailController,
                              onChanged: (value) {
                                email = value;
                              },

                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(32),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  hintText: 'email',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF87837e),
                                  ),
                                  suffixIcon: Icon(Icons.email_rounded),
                                  hoverColor: Colors.yellow,
                                  filled: true,
                                  focusColor: Colors.yellow),
                              style: TextStyle(color: Colors.black)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: 'Gender',
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.black),
                                  children:
                                  [
                                    TextSpan(
                                      text:' *',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16.0),
                                    ),                                           ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child:   DropdownButtonFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(32.0))),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                      )
                                  ),
                                  value: Gender,
                                  hint: Text('Select Gender'),
                                  items: [
                                    DropdownMenuItem(
                                      child: Text('Male'),
                                      value: 'Male',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Female'),
                                      value: 'Female',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Others'),
                                      value: 'Others',
                                    ),
                                  ],
                                  onChanged: (val) {
                                    setState(() {
                                      Gender = val;
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: 'Vegetarian',
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.black),
                                  children:
                                  [
                                    TextSpan(
                                      text:' *',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16.0),
                                    ),                                           ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child:   DropdownButtonFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(32.0))),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                      )
                                  ),
                                  value: vegetarian,
                                  hint: Text('Yes/No'),
                                  items: [
                                    DropdownMenuItem(
                                      child: Text('Yes'),
                                      value: 'Yes',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('No'),
                                      value: 'No',
                                    ),
                                  ],
                                  onChanged: (val) {
                                    setState(() {
                                      vegetarian = val;
                                    });
                                  }),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CheckboxListTile(
                                      title: Text("To avail maximum benefits, get notified above our latest offers and promotions via SMS, Email and Push notification"),
                                      value: checkedValue,
                                      onChanged: _setAgreedToTOS,
                                    ),
                                  ],
                                )
                            ),
                            Center(
                              child: FlatButton(color: Theme.of(context).primaryColor,
                                  onPressed: () async{
                                    try {
                                      await _auth
                                          .createUserWithEmailAndPassword(
                                          email: email ==null ? widget.email : email, password: widget.password)
                                          .then((SignedInUser) {
                                        UserManagement(name: name,gender: Gender,vegetarian: vegetarian,email: email).StoreNewUser(SignedInUser, context);
                                      });
                                      setState(() {
                                        showSpinner = true;
                                      });
                                    } catch (e) {
                                      print(e);
                                    }
                                    setState(() {
                                      namekey.currentState.validate();
                                      emailkey.currentState.validate();
                                    });
                                  },
                                  child: Text('Submit',style: TextStyle(color: Colors.white),)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          })
        ),
      ),
    );
  }
  void _setAgreedToTOS(bool newValue){
    setState(() {
      checkedValue=newValue;
    });
  }
}


class UserManagement {
  final name;
  final gender;
  final vegetarian;
  final email;
  UserManagement({this.name,this.gender,this.vegetarian,this.email});
  StoreNewUser(user,context){
    Firestore.instance.collection('/users').add({
      'email' : email==null ?  FirebaseAuth.instance.currentUser.email : email,
      'uid' : FirebaseAuth.instance.currentUser.uid,
      'role' : 'User',
      'name' : name,
      'Gender' : gender,
      'Vegetarian': vegetarian,
    }).then((value) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    }).catchError((e){
      print(e);
    });
  }



  Future getUserList() async {
    return await Firestore.instance.collection('users').snapshots();
  }

}




