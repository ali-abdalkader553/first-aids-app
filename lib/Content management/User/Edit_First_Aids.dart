import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_aids_app_pro1/Content%20management/User/CustomButton.dart';
import 'package:first_aids_app_pro1/Content%20management/User/CustomTextField.dart';
import 'package:flutter/material.dart';

class Edit_First_Aids extends StatefulWidget {
  final String docid;
  final String oldname;
  const Edit_First_Aids({Key? key, required this.docid, required this.oldname})
      : super(key: key);

  @override
  State<Edit_First_Aids> createState() => _Edit_First_AidsState();
}

class _Edit_First_AidsState extends State<Edit_First_Aids> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  CollectionReference firstaids =
      FirebaseFirestore.instance.collection("first-aids");

  editfirstaids() async {
    if (formState.currentState!.validate()) {
      try {
        await firstaids.doc(widget.docid).update({
          "name": name.text,
        });
        Navigator.pop(context);
      } catch (e) {
        print("Error  $e");
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text = widget.oldname;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(title: Text("dashboard")),
      body: Form(
        key: formState,
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: CustomTextField(
              hittext: "Enter the new name of state",
              addconroller: name,
            ),
          ),
          CustomButton(
              onPressed: () {
                editfirstaids();
              },
              title: "save  ")
        ]),
      ),
    );
  }
}
