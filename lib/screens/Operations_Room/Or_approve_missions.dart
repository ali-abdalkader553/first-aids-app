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
  List<QueryDocumentSnapshot> missionsdata = [];

  bool isloading = true;

  ApproveData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("mission-information")
        .get();
    missionsdata.addAll(querySnapshot.docs);

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
          : GridView.builder(
              itemCount: missionsdata.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisExtent: 200),
              itemBuilder: (context, i) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'رقم المريض:'
                              "${missionsdata[i]['number_of_mission_requester']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${missionsdata[i]['name_of_the_mission_requester']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${missionsdata[i]['patiant_name']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${missionsdata[i]['age']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${missionsdata[i]['awareness']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${missionsdata[i]['breathing']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${missionsdata[i]['building_number']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${missionsdata[i]['details']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${missionsdata[i]['from']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${missionsdata[i]['to']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${missionsdata[i]['history_of_illness']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${missionsdata[i]['sex']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
