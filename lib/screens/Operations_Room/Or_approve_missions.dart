import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrApproveTheMisssion extends StatefulWidget {
  final String approveid;

  const OrApproveTheMisssion({
    Key? key,
    required this.approveid,
  }) : super(key: key);

  @override
  State<OrApproveTheMisssion> createState() => _OrApproveTheMisssion();
}

class _OrApproveTheMisssion extends State<OrApproveTheMisssion> {
  late Map<String, dynamic>? missionsdata;

  bool isloading = true;

  ApproveData() async {
    var querySnapshot = (await FirebaseFirestore.instance
            .collection("mission-information")
            .doc(widget.approveid)
            .get())
        .data();

    missionsdata = (querySnapshot);

    missionsdata ??= {};

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
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'رقم المريض:'
                            "${missionsdata!['number_of_mission_requester']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${missionsdata!['name_of_the_mission_requester']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${missionsdata!['patiant_name']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${missionsdata!['age']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${missionsdata!['awareness']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${missionsdata!['breathing']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${missionsdata!['building_number']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${missionsdata!['details']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${missionsdata!['from']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${missionsdata!['to']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${missionsdata!['history_of_illness']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${missionsdata!['sex']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection("mission-information")
                              .doc(widget.approveid)
                              .update({'status': 'accepted'});
                          Navigator.pop(context);
                        },
                        child: Text('موافقة'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection("mission-information")
                              .doc(widget.approveid)
                              .update({'status': 'rejected'});
                          Navigator.pop(context);
                        },
                        child: Text('رفض'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
