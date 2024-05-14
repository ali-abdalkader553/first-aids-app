import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_aids_app_pro1/Content%20management/User/Edit_First_Aids.dart';
import 'package:flutter/material.dart';

import '../../auth/auth_helper.dart';
import 'DataStateOfExplanations.dart';

class FirstAidPage extends StatefulWidget {
  const FirstAidPage({Key? key}) : super(key: key);

  @override
  State<FirstAidPage> createState() => _FirstAidPageState();
}

class _FirstAidPageState extends State<FirstAidPage> {
  List<QueryDocumentSnapshot> firstaidsdata = [];
  bool isSearchOn = false;

  TextEditingController _searchController = TextEditingController();

  bool isloading = true;

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("first-aids").get();
    firstaidsdata = [];
    firstaidsdata.addAll(querySnapshot.docs);

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
                Navigator.of(context).pushNamed("addfirstaid").whenComplete(() {
                  getData();
                });
              },
              child: Icon(Icons.add),
            ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: isSearchOn
            ? TextField(controller: _searchController)
            : Text('First Aids'),
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
              children: (firstaidsdata.map((e) {
                if (_searchController.text.isNotEmpty) {
                  if (!(e['name'] as String).contains(_searchController.text)) {
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
                                .doc(e.id)
                                .delete();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FirstAidPage()));
                            // MaterialPageRoute(
                            //     builder: (context) => FirstAidPage()));
                          },
                          btnOkOnPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Edit_First_Aids(
                                        docid: e.id, oldname: e['name'])));
                          },
                        ).show();
                      }
                    },
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DataStateOfExplanations(firstaidid: e.id)));
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
                            "${e['name']}",
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
