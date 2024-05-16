import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_aids_app_pro1/Content%20management/User/Edit_Diseases.dart';
import 'package:first_aids_app_pro1/screens/User/Diseases_Explanations.dart';
import 'package:flutter/material.dart';

import '../../auth/auth_helper.dart';

class CommonDiseasesPage extends StatefulWidget {
  const CommonDiseasesPage({Key? key}) : super(key: key);

  @override
  State<CommonDiseasesPage> createState() => _CommonDiseasesPage();
}

class _CommonDiseasesPage extends State<CommonDiseasesPage> {
  List<QueryDocumentSnapshot> diseasesdata = [];
  bool isSearchOn = false;

  TextEditingController _searchController = TextEditingController();

  bool isloading = true;

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("common-diseases").get();
    diseasesdata = [];
    diseasesdata.addAll(querySnapshot.docs);

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
      floatingActionButton: !AuthUser.instance.isAdmin
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.redAccent,
              onPressed: () {
                Navigator.of(context).pushNamed("adddiseases").whenComplete(() {
                  getData();
                });
              },
              child: Icon(Icons.add),
            ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: isSearchOn
            ? TextField(controller: _searchController)
            : Text('Common Diseases'),
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
              children: (diseasesdata.map((d) {
                if (_searchController.text.isNotEmpty) {
                  if (!(d['name'] as String).contains(_searchController.text)) {
                    return const SizedBox(
                      width: 0,
                      height: 0,
                    );
                  }
                }
                return Container(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: MediaQuery.sizeOf(context).width * 0.5,
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
                                    .collection("common-diseases")
                                    .doc(d.id)
                                    .delete();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CommonDiseasesPage()));
                                // MaterialPageRoute(
                                //     builder: (context) => FirstAidPage()));
                              },
                              btnOkOnPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Edit_Diseases(
                                            docid: d.id, oldname: d['name'])));
                              },
                            ).show();
                    },
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Diseases_Explanations(diseasesid: d.id)));
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
                            "${d['name']}",
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
