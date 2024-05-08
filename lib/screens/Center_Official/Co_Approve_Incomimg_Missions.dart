import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CoapproveIncMissInformation extends StatefulWidget {
  const CoapproveIncMissInformation({
    Key? key,
  }) : super(key: key);

  @override
  State<CoapproveIncMissInformation> createState() =>
      _CoapproveIncMissInformation();
}

class _CoapproveIncMissInformation extends State<CoapproveIncMissInformation> {
  List<QueryDocumentSnapshot> coincomingmissionsdata = [];

  bool isloading = true;

  ApproveData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("or-mission-information")
        .get();
    coincomingmissionsdata.addAll(querySnapshot.docs);

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
              itemCount: coincomingmissionsdata.length,
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
                              "${coincomingmissionsdata[i]['number_of_mission_requester']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${coincomingmissionsdata[i]['name_of_the_mission_requester']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${coincomingmissionsdata[i]['patiant_name']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${coincomingmissionsdata[i]['age']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${coincomingmissionsdata[i]['awareness']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${coincomingmissionsdata[i]['breathing']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${coincomingmissionsdata[i]['building_number']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${coincomingmissionsdata[i]['details']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${coincomingmissionsdata[i]['from']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${coincomingmissionsdata[i]['to']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${coincomingmissionsdata[i]['history_of_illness']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${coincomingmissionsdata[i]['sex']}",
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
