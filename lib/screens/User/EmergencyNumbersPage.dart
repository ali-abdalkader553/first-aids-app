import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_aids_app_pro1/Content%20management/User/Edit_Number.dart';
import 'package:flutter/material.dart';

import '../../auth/auth_helper.dart';

class EmergencyNumberPage extends StatefulWidget {
  const EmergencyNumberPage({Key? key}) : super(key: key);

  @override
  State<EmergencyNumberPage> createState() => _EmergencyNumberPageState();
}

class _EmergencyNumberPageState extends State<EmergencyNumberPage> {
  List<QueryDocumentSnapshot> emergencynum = [];

  bool isloading = true;

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("emergency-number").get();
    emergencynum = [];
    emergencynum.addAll(querySnapshot.docs);

    isloading = false;

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: !AuthUser.instance.isAdmin
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.redAccent,
              onPressed: () {
                Navigator.of(context).pushNamed("addnumber").whenComplete(() {
                  getData();
                });
              },
              child: Icon(Icons.add),
            ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Emergency Number'),
      ),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: emergencynum.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 200),
              itemBuilder: (context, i) {
                return Container(
                  width: 200,
                  height: 125,
                  child: InkWell(
                    onLongPress: () {
                      !AuthUser.instance.isAdmin
                          ? null
                          : AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              animType: AnimType.rightSlide,
                              title: "error",
                              desc: 'What do you wont to do?',
                              btnCancelText: "delete",
                              btnOkText: "update",
                              btnCancelOnPress: () async {
                                await FirebaseFirestore.instance
                                    .collection("emergency-number")
                                    .doc(emergencynum[i].id)
                                    .delete();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EmergencyNumberPage()));
                              },
                              btnOkOnPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Edit_Number(
                                              docid: emergencynum[i].id,
                                              oldname: emergencynum[i]['name'],
                                              oldnumber: emergencynum[i]
                                                  ['number'],
                                            )));
                              },
                            ).show();
                    },
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
                                "${emergencynum[i]['name']}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                "${emergencynum[i]['number']}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
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
