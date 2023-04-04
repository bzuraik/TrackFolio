// ignore_for_file: camel_case_types, file_names
import 'package:flutter/material.dart';
import 'package:trackfolio/pages/addClientPage.dart';
import '/widgets/bottom_navigation_bar.dart';
import '../classes/client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class clientListPage extends StatelessWidget {
  final Function(int) onItemTapped;

  const clientListPage({super.key, required this.onItemTapped});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const SafeArea(
        child: BodyWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF72C3E6),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => AddClients(
                      onItemTapped: onItemTapped,
                    )),
          );
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: onItemTapped,
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  // Replace the hardcoded user ID with the actual user ID from your app
  final String userId = '46674046405012463842';

  @override
  Widget build(BuildContext context) {
    CollectionReference clientsRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('clients');

    return StreamBuilder<QuerySnapshot>(
      stream: clientsRef.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final List<Client> clients =
            snapshot.data!.docs.map((DocumentSnapshot document) {
          return Client(
            // Assuming each document has a 'name' field
            clientName: document['name'],
            // Set the clientImage to an empty string or a placeholder image URL
            // Set the clientImage to an empty string or a placeholder image URL
            clientImage: document[
                'imageURL'], // Replace this with a placeholder image URL if needed
            clientCompany: document[
                'company'], // Assuming each document has a 'company' field
          );
        }).toList();
        final List<Client> pinnedClients = clients.take(3).toList();
        return SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Pinned Clients',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const <Widget>[
                        Icon(Icons.push_pin),
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //Change the next item to show the number of pinned items
                  itemCount: pinnedClients.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 110,
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        color: const Color(0xFF72C3E6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(clients[index].clientImage),
                            radius: 30.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              clients[index].clientName,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF003B57),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'All Clients',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.filter_alt),
                          onPressed: () {
                            // handle filter button press
                          },
                          iconSize: 32.0,
                          color: const Color(0xFF003B57),
                          tooltip: 'Filter',
                          splashRadius: 24.0,
                          padding: const EdgeInsets.all(10),
                          constraints: const BoxConstraints(),
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                        ),
                        IconButton(
                          icon: const Icon(Icons.sort_by_alpha),
                          onPressed: () {
                            // handle sort button press
                          },
                          iconSize: 32.0,
                          color: const Color(0xFF003B57),
                          tooltip: 'Sort',
                          splashRadius: 24.0,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // List of all clients
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: clients.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 18),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                          color: Color(0xff008BCC),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(clients[index].clientImage),
                            radius: 30.0,
                          ),
                          title: Text(
                            clients[index].clientName,
                            style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                            clients[index].clientCompany,
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.white),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: const Color(0xFF003B57),
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
