import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UnAcceptableMissions extends StatefulWidget {
  const UnAcceptableMissions({
    Key? key,
  }) : super(key: key);

  @override
  State<UnAcceptableMissions> createState() => _UnAcceptableMissions();
}

class _UnAcceptableMissions extends State<UnAcceptableMissions> {
  List<QueryDocumentSnapshot> unacceptables = [];

  bool isloading = true;

  unacceptes() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("or-mission-rejected-information")
        .get();
    unacceptables.addAll(querySnapshot.docs);

    isloading = false;

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    unacceptes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('الطلبات المرفوضة'),
      ),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: unacceptables.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisExtent: 200),
              itemBuilder: (context, i) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'رقم المريض:'
                            "${unacceptables[i]['number_of_mission_requester']}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            "${unacceptables[i]['name_of_the_mission_requester']}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            "${unacceptables[i]['patiant_name']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${unacceptables[i]['age']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${unacceptables[i]['awareness']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${unacceptables[i]['breathing']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${unacceptables[i]['building_number']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${unacceptables[i]['details']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${unacceptables[i]['from']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${unacceptables[i]['to']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${unacceptables[i]['history_of_illness']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            "${unacceptables[i]['sex']}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
