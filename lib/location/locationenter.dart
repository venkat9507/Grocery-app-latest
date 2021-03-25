import 'package:flutter/material.dart';

class LocationEnter extends StatefulWidget {
  @override
  _LocationEnterState createState() => _LocationEnterState();
}

class _LocationEnterState extends State<LocationEnter> {
  String house = 'Appartment';
  TextEditingController city,
      houseno,
      floor,
      buildingname,
      street,
      sublocality,
      locality,
      pincode,
      landmark;
  bool isselected = false;
  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Save Address'),
        ),
        body: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                            title: Text(
                              'Appartment',
                              // style: TextStyle(fontSize: size.width * 0.0332),
                            ),
                            selected: isselected,
                            value: 'Appartment',
                            groupValue: house,
                            onChanged: (val) {
                              setState(() {
                                house = val;
                              });
                            }),
                      ),
                      Expanded(
                        child: RadioListTile(
                            title: Text(
                              'Individual House',
                              // style:
                              // TextStyle(fontSize: size.width * 0.0332)
                            ),
                            selected: isselected,
                            value: 'Individual House',
                            groupValue: house,
                            onChanged: (val) {
                              setState(() {
                                house = val;
                              });
                            }),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'City *',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: city,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Houuse/Flat/Block No *',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: houseno,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Floor *',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: floor,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Building Name *',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: buildingname,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Street *',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: street,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sub Locality *',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: sublocality,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Locality *',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: locality,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Pincode *',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: pincode,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Landmark *',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: landmark,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  // Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: size.width,
                      child: FlatButton(
                        color: Color(0xFF9B63DC),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Save Address and proceed ➜',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
