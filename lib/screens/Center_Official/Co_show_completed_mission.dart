import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CoShowCompletedMissionsInfo extends StatefulWidget {
  String completeid;

  CoShowCompletedMissionsInfo({
    Key? key,
    required this.completeid,
  }) : super(key: key);

  @override
  State<CoShowCompletedMissionsInfo> createState() =>
      _CoShowCompletedMissionsInfo();
}

class _CoShowCompletedMissionsInfo extends State<CoShowCompletedMissionsInfo> {
  late Map<String, dynamic>? completemissionsdata;

  bool isloading = true;

  ApproveData() async {
    setState(() {
      isloading = true;
    });

    QuerySnapshot querySnapshot = (await FirebaseFirestore.instance
        .collection("mission-information")
        .doc(widget.completeid)
        .collection("team-info")
        .get());

    completemissionsdata = (querySnapshot) as Map<String, dynamic>?;

    completemissionsdata ??= {};

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
        backgroundColor: Colors.red,
        title: Text(
          'منجزة من قبل الفريق الإسعافي',
          style: TextStyle(color: Colors.white),
        ),
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
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'رقم المريض:'
                            "${completemissionsdata!['team_leader']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${completemissionsdata!['scout']}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            "${completemissionsdata!['first_paramedic']}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            "${completemissionsdata!['second_paramedic']}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            "${completemissionsdata!['third_paramedic']}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            "${completemissionsdata!['driver']}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            "${completemissionsdata!['car_num']}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
