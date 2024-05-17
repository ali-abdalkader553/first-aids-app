import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CoapproveIncMissInformation extends StatefulWidget {
  String docId;
  CoapproveIncMissInformation({
    required this.docId,
    Key? key,
  }) : super(key: key);

  @override
  State<CoapproveIncMissInformation> createState() =>
      _CoapproveIncMissInformation();
}

class _CoapproveIncMissInformation extends State<CoapproveIncMissInformation> {
  late Map<String, dynamic>? coincomingmissionsdata;

  bool isloading = true;

  ApproveData() async {
    var querySnapshot = (await FirebaseFirestore.instance
            .collection("mission-information")
            .doc(widget.docId)
            .get())
        .data();

    coincomingmissionsdata = (querySnapshot);

    coincomingmissionsdata ??= {};

    isloading = false;

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    ApproveData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('الموافقة على المهمة'),
      ),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'رقم المريض:'
                          "${coincomingmissionsdata!['number_of_mission_requester']}",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          "${coincomingmissionsdata!['name_of_the_mission_requester']}",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          "${coincomingmissionsdata!['patiant_name']}",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          "${coincomingmissionsdata!['age']}",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          "${coincomingmissionsdata!['awareness']}",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          "${coincomingmissionsdata!['breathing']}",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          "${coincomingmissionsdata!['building_number']}",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          "${coincomingmissionsdata!['details']}",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          "${coincomingmissionsdata!['from']}",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          "${coincomingmissionsdata!['to']}",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          "${coincomingmissionsdata!['history_of_illness']}",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          "${coincomingmissionsdata!['sex']}",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection("mission-information")
                              .doc(widget.docId)
                              .update({'status': 'acceptedByCo'});
                          Navigator.pop(context);
                        },
                        child: Text('قبول'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection("mission-information")
                              .doc(widget.docId)
                              .update({'status': 'rejectedByCO'});
                          Navigator.pop(context);
                        },
                        child: Text('رفض'),
                      )
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
