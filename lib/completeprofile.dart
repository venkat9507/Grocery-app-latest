import 'package:flutter/material.dart';

class CompleteProfile extends StatefulWidget {
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  TextEditingController name, email;
  String gender, vegetarian;
  bool ischeked = false;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Complete Profile'),
        ),
        body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Name *',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Email *',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Gender *',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text('Choose Gender'),
                      ),
                      DropdownMenuItem(
                        child: Text('Male'),
                      ),
                      DropdownMenuItem(
                        child: Text('Female'),
                      ),
                      DropdownMenuItem(
                        child: Text('Not to Mention'),
                      ),
                    ],
                    onChanged: (val) {
                      setState(() {
                        gender = val;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Vegetarian *',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text('Vegetarian'),
                      ),
                      DropdownMenuItem(
                        child: Text('Yes'),
                      ),
                      DropdownMenuItem(
                        child: Text('No'),
                      ),
                    ],
                    onChanged: (val) {
                      setState(() {
                        vegetarian = val;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                          'To avail maximum benifits, get notified above our latest offers and promotions via SMS, Email and Push Notification.'),
                      value: ischeked,
                      onChanged: (val) {
                        setState(() {
                          ischeked = !ischeked;
                        });
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
