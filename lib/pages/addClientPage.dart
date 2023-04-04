import 'package:flutter/material.dart';
import '/widgets/bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homePage.dart';

class AddClients extends StatelessWidget {
  final Function(int) onItemTapped;

  var documentID;

  AddClients({required this.onItemTapped});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _imageURLController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  BuildContext get context => this.context;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 1,
          onTap: onItemTapped,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(),
              child: Center(
                child: Text(
                  "New Client",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),


            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff008BCC),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                          child: Row(
                            children: [
                              // profile pic
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundColor: Colors.blue,
                                      child: CircleAvatar(
                                        radius: 58,
                                        backgroundColor: Colors.white,
                                        //backgroundImage: NetworkImage(
                                        //'INSERT_YOUR_URL_HERE',
                                        // ),
                                        //),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // name and company
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 7.0, right: 5.0),
                                          child: TextFormField(
                                            controller: _nameController,
                                            style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              labelText: 'Enter Client Name',
                                              labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                              hintStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.blue),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 7.0, right: 5.0),
                                          child: TextFormField(
                                            controller: _companyController,
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 20),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              labelText: 'Enter Client Company',
                                              labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                              hintStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.blue),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),

                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: Column(children: [
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              'IMAGE URL',
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: _imageURLController,
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),

                    // ADDRESS
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: Column(children: [
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              'ADDRESS',
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: _addressController,
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),

                    // PHONE
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: Column(children: [
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              'PHONE',
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: _phoneController,
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),

                    // NOTES
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: Column(children: [
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text('NOTES',
                                textAlign: TextAlign.start,
                                style: TextStyle(color: Colors.white)),
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: _notesController,
                              style: TextStyle(color: Colors.white),
                              minLines: 4,
                              maxLines: 4,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  gapPadding: 10.0,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () => {
                        _submitClient(),
                        redirectToNewPage(context),
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff008BCC)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      child: Text('Save Client'),
                    ),
                  ],
                ),
              ),
            ),
          ],),
      ),
    );
  }

  Future<void> redirectToNewPage(BuildContext context) async {
    // final ref = FirebaseFirestore.instance.collection('46674046405012463842');
    // final doc = await ref.orderBy('timestamp', descending: true).limit(1).get();
    // if (doc.docs.isNotEmpty) {
    //   String docNumber = doc.docs.first.id;
    //   print('Document ID: $docNumber');
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => ClientsProfile(
    //           onItemTapped: onItemTapped,
    //           id: docNumber,
    //         )),
    //   );
    // } else {
    //   print('FAILED');
    // }

    Navigator.push(
      context,
      MaterialPageRoute(
        // builder: (context) => ClientsProfile(data: documentID),
        builder: (context) => HomePage()),
    );
  }

  void _submitClient() async {
    final String name = _nameController.text;
    final String image = _imageURLController.text;
    final String company = _companyController.text;
    final String address = _addressController.text;
    final String phone = _phoneController.text;
    final String notes = _notesController.text;

    FirebaseFirestore.instance
        .collection('users')
        .doc('46674046405012463842')
        .collection('clients')
        .add({
      'name': name,
      'imageURL': image,
      'company': company,
      'address': address,
      'phone': phone,
      'notes': notes,
      'timestamp': FieldValue.serverTimestamp(),
      'documentID': "",
    }).then((value) {
      print('Project added to Firestore!');
      documentID = value.id; // get the document ID
      Navigator.pushNamed(context, '/home');
    }).catchError((error) {
      print('Failed to add project: $error');
    });
  }

}

//top bar navigation
AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: const Color(0xFF003B57),
    actions: [],
    title: Row(
      children: const [
        Icon(
          Icons.notifications,
          color: Colors.white,
        ),
        SizedBox(width: 20),
        Spacer(),
        Icon(
          Icons.search,
          color: Colors.white,
        ),

      ],
    ),
  );
}

