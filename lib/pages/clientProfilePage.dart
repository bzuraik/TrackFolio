// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ClientsProfile extends StatelessWidget {
  const ClientsProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "CLIENT PROFILE",
            style: TextStyle(color: Colors.black),
          ),
          // go back to main page
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
        ),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
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
                  child: Row(
                    children: [
                      // profile pic
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.blue,
                            child: CircleAvatar(
                              radius: 58,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                'https://cloudfront-us-east-1.images.arcpublishing.com/tbt/RLVAC6RWJVDVXEH4MVGUKKOSUQ.jpeg',
                              ),
                            ),
                          ),
                        ),
                      ),

                      // name and company
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 7.0, right: 5.0),
                              child: Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    "Ted Lasso",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7.0, right: 5.0),
                              child: Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    "AFC Richmond",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // ADDRESS
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    child: Column(children: const [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'ADDRESS',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 5.0),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            '4783 Gordon Street',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),

                // PHONE
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    child: Column(children: const [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'PHONE',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 5.0),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            '(473) 751-5699',
                            style: TextStyle(color: Colors.white),
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
                    margin: const EdgeInsets.all(5.0),
                    child: Column(children: [
                      const Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text('NOTES',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 0.8),
                              borderRadius: BorderRadius.circular(13.0)),
                          child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "this customer always asks for extra discount..",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                    ]),
                  ),
                ),

                // PROJECTS
                const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child:
                      Text('  PROJECTS', style: TextStyle(color: Colors.white)),
                ),

                Expanded(
                  flex: 2,
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.8),
                            borderRadius: BorderRadius.circular(13.0)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.8),
                            borderRadius: BorderRadius.circular(13.0)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.8),
                            borderRadius: BorderRadius.circular(13.0)),
                      ),
                    ),
                  ]),
                ),

                // SEE ALL BUTTON
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {}, //go to all projects
                    child: const Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Text(
                        'See all',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
