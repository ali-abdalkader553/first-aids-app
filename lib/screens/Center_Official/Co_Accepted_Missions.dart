import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CoAcceptableMissions extends StatefulWidget {
  const CoAcceptableMissions({
    Key? key,
  }) : super(key: key);

  @override
  State<CoAcceptableMissions> createState() => _CoAcceptableMissions();
}

class _CoAcceptableMissions extends State<CoAcceptableMissions> {
  List<QueryDocumentSnapshot> acceptables = [];

  bool isloading = true;

  acceptes() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("mission-information")
        .get();

    for (var ele in querySnapshot.docs) {
      var e = ele.data() as Map;
      if (e['status'] == 'acceptedByCo') {
        acceptables.add(ele);
      }
    }

    isloading = false;

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    acceptes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('الطلبات المقبولة'),
      ),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: acceptables.length,
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
                              "${acceptables[i]['number_of_mission_requester']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${acceptables[i]['name_of_the_mission_requester']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${acceptables[i]['patiant_name']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${acceptables[i]['age']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${acceptables[i]['awareness']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${acceptables[i]['breathing']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${acceptables[i]['building_number']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${acceptables[i]['details']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${acceptables[i]['from']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${acceptables[i]['to']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${acceptables[i]['history_of_illness']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              "${acceptables[i]['sex']}",
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
