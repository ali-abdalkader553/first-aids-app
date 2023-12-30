import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_aids_app_pro1/Content%20management/Edit_First_Aids.dart';
import 'package:first_aids_app_pro1/screens/DataStateOfExplanations.dart';
import 'package:flutter/material.dart';

class FirstAidPage extends StatefulWidget {
  const FirstAidPage({Key? key}) : super(key: key);

  @override
  State<FirstAidPage> createState() => _FirstAidPageState();
}

class _FirstAidPageState extends State<FirstAidPage> {
  List<QueryDocumentSnapshot> firstaidsdata = [];

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
                Navigator.of(context).pushNamed("addfirstaid").whenComplete(() {
                  getData();
                });
              },
              child: Icon(Icons.add),
            ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('First Aids'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
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
                  width: 125,
                  height: 125,
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
                                    builder: (context) => FirstAidPage()));
                          },
                          btnOkOnPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Edit_First_Aids(
                                        docid: firstaidsdata[i].id,
                                        oldname: firstaidsdata[i]['name'])));
                          },
                        ).show();
                      }
                    },
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DataStateOfExplanations(
                                  firstaidid: firstaidsdata[i].id)));
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
                            "${firstaidsdata[i]['name']}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
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
