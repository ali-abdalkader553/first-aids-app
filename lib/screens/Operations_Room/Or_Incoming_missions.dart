import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_aids_app_pro1/screens/Operations_Room/Or_approve_missions.dart';
import 'package:flutter/material.dart';

class OrIncomingMission extends StatefulWidget {
  const OrIncomingMission({Key? key}) : super(key: key);

  @override
  State<OrIncomingMission> createState() => _OrIncomingMissionState();
}

class _OrIncomingMissionState extends State<OrIncomingMission> {
  List<QueryDocumentSnapshot> incomingmissions = [];
  bool isSearchOn = false;

  TextEditingController _searchController = TextEditingController();

  bool isloading = true;

  getData() async {
    setState(() {
      isloading = true;
    });

    QuerySnapshot querySnapshot = (await FirebaseFirestore.instance
        .collection("mission-information")
        .get());
    incomingmissions = [];

    for (var ele in querySnapshot.docs) {
      print(ele.data());
      var e = ele.data() as Map;
      if (e['status'] == 'pending' || e['status'] == null) {
        incomingmissions.add(ele);
      }
    }

    isloading = false;

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    _searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: isSearchOn
            ? TextField(controller: _searchController)
            : Text('الطلبات الواردة'),
        leading: IconButton(
          onPressed: () {
            setState(() {
              isSearchOn = !isSearchOn;
            });
          },
          icon: const Icon(Icons.search),
        ),
      ),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Wrap(
              children: (incomingmissions.map((e) {
                if (_searchController.text.isNotEmpty) {
                  if (!(e['patiant_name'] as String)
                      .contains(_searchController.text)) {
                    return const SizedBox(
                      width: 0,
                      height: 0,
                    );
                  }
                }
                return SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrApproveTheMisssion(
                            approveid: e.id,
                          ),
                        ),
                      ).whenComplete(() {
                        getData();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "${e['patiant_name']}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList()),
            ),
    );
  }
}
