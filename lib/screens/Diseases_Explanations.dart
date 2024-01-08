import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_aids_app_pro1/Content%20management/Add_Diseases_Explanations.dart';
import 'package:first_aids_app_pro1/Content%20management/Edit_Diseases_Explanations.dart';
import 'package:flutter/material.dart';

class Diseases_Explanations extends StatefulWidget {
  final String diseasesid;

  const Diseases_Explanations({
    Key? key,
    required this.diseasesid,
  }) : super(key: key);

  @override
  State<Diseases_Explanations> createState() => _Diseases_Explanations();
}

class _Diseases_Explanations extends State<Diseases_Explanations> {
  List<QueryDocumentSnapshot> diseasesdata = [];

  bool isloading = true;

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("common-diseases")
        .doc(widget.diseasesid)
        .collection("explanation")
        .get();
    diseasesdata.addAll(querySnapshot.docs);

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
                        Add_Diseases_Explanation(docid: widget.diseasesid)));
              },
              child: Icon(Icons.add),
            ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Diseases Explanations'),
      ),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: diseasesdata.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisExtent: 300),
              itemBuilder: (context, i) {
                return Expanded(
                  child: Container(
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
                                  .collection("common-diseases")
                                  .doc(widget.diseasesid)
                                  .collection("explanation")
                                  .doc(diseasesdata[i].id)
                                  .delete();
                              Navigator.pop(
                                context,
                              );
                            },
                            btnOkOnPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Edit_Diseases_Explanation(
                                              diseasesexplanationdocid:
                                                  diseasesdata[i].id,
                                              commondiseasesid:
                                                  widget.diseasesid,
                                              value: diseasesdata[i]
                                                  ['explanation'])));
                            },
                          ).show();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(children: [
                            Text(
                              "${diseasesdata[i]['explanation']}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            if (diseasesdata[i]['url'] != "none")
                              Image.network(diseasesdata[i]['url']),
                          ]),
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
