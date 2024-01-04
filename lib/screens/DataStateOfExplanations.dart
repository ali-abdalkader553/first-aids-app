import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_aids_app_pro1/Content%20management/Edit_First_Aids.dart';
import 'package:flutter/material.dart';

import '../Content management/Add_explanation.dart';

class DataStateOfExplanations extends StatefulWidget {
  final String firstaidid;

  const DataStateOfExplanations({Key? key, required this.firstaidid})
      : super(key: key);

  @override
  State<DataStateOfExplanations> createState() => _DataStateOfExplanations();
}

class _DataStateOfExplanations extends State<DataStateOfExplanations> {
  List<QueryDocumentSnapshot> firstaidsdata = [];

  bool isloading = true;

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("first-aids")
        .doc(widget.firstaidid)
        .collection("explanation")
        .get();
    firstaidsdata.addAll(querySnapshot.docs);

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
      floatingActionButton: FirebaseAuth.instance.currentUser == null
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.redAccent,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Add_Explanation(docid: widget.firstaidid)));
              },
              child: Icon(Icons.add),
            ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Explanations'),
      ),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: firstaidsdata.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 160),
              itemBuilder: (context, i) {
                return Container(
                  child: InkWell(
                    onLongPress: () {
                      if (FirebaseAuth.instance.currentUser != null) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: "error",
                          desc: 'What do you wont to do?',
                          btnCancelText: "delete",
                          btnOkText: "update",
                          btnCancelOnPress: () async {
                            await FirebaseFirestore.instance
                                .collection("first-aids")
                                .doc(firstaidsdata[i].id)
                                .delete();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DataStateOfExplanations(
                                          firstaidid: '',
                                        )));
                          },
                          btnOkOnPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Edit_First_Aids(
                                        docid: '',
                                        oldname: firstaidsdata[i]['name'])));
                          },
                        ).show();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Center(
                          child: Text(
                            "${firstaidsdata[i]['explanation']}",
                            style: TextStyle(color: Colors.black, fontSize: 20),
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
