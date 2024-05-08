import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_aids_app_pro1/screens/Center_Official/Co_Approve_Incomimg_Missions.dart';
import 'package:flutter/material.dart';

class CoIncomingMissions extends StatefulWidget {
  const CoIncomingMissions({Key? key}) : super(key: key);

  @override
  State<CoIncomingMissions> createState() => _CoIncomingMissionsState();
}

class _CoIncomingMissionsState extends State<CoIncomingMissions> {
  List<QueryDocumentSnapshot> coincomingmissions = [];
  bool isSearchOn = false;

  TextEditingController _searchController = TextEditingController();

  bool isloading = true;
  getData() async {
    QuerySnapshot querySnapshot = (await FirebaseFirestore.instance
        .collection("or-mission-information")
        .get());
    coincomingmissions = [];
    coincomingmissions.addAll(querySnapshot.docs);

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
        backgroundColor: Colors.red,
        title: isSearchOn
            ? TextField(controller: _searchController)
            : Text(
                'الطلبات الواردة',
                style: TextStyle(color: Colors.white),
              ),
        leading: IconButton(
          onPressed: () {
            setState(() {
              isSearchOn = !isSearchOn;
            });
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Wrap(
                children: (coincomingmissions.map((e) {
                  if (_searchController.text.isNotEmpty) {
                    if (!(e['patiant_name'] as String)
                        .contains(_searchController.text)) {
                      return const SizedBox(
                        width: 0,
                        height: 0,
                      );
                    }
                  }
                  return Container(
                    height: MediaQuery.sizeOf(context).width * 0.2,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CoapproveIncMissInformation()));
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList()),
              ),
            ),
    );
  }
}
