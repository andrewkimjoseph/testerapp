import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UserChat extends StatefulWidget {
  const UserChat({super.key, required this.email});

  final String? email;
  @override
  State<UserChat> createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  late Map fetchedBookingData;

  Map bookingsData = {};

  Future<Map<dynamic, dynamic>> getBookingData() async {
    var uidEmail = widget.email!.replaceAll(".", "@");
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child(uidEmail).get();

    if (snapshot.exists) {
      fetchedBookingData = snapshot.value as Map;
      bookingsData = fetchedBookingData;
      return fetchedBookingData;
    } else {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Bookings',
            style: TextStyle(fontFamily: 'Roboto'),
          ),
        ),
        body: FutureBuilder(
            future: getBookingData(),
            builder: (context, AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
              return snapshot.hasData
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
                          ),
                          for (var bookingData in bookingsData.values)
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: SizedBox(
                                width: 500,
                                height: 75,
                                child: ListTile(
                                  title: Text(
                                      "CHILD'S NAME: ${bookingData['childnames']}",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  subtitle: Text(
                                      "DROP OFF LOCATION:${bookingData['dropofflocation']}\nPICKUPLOCATION: ${bookingData['pickuplocation']}",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            }));
  }
}
