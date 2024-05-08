import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_aids_app_pro1/Content%20management/User/CustomButton.dart';
import 'package:first_aids_app_pro1/Content%20management/User/CustomTextField.dart';
import 'package:flutter/material.dart';

class Edit_Number extends StatefulWidget {
  final String docid;
  final String oldname;
  final String oldnumber;
  const Edit_Number(
      {Key? key,
      required this.docid,
      required this.oldname,
      required this.oldnumber})
      : super(key: key);

  @override
  State<Edit_Number> createState() => _Edit_Number();
}

class _Edit_Number extends State<Edit_Number> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  CollectionReference firstaids =
      FirebaseFirestore.instance.collection("emergency-number");

  editnumber() async {
    if (formState.currentState!.validate()) {
      try {
        await firstaids.doc(widget.docid).update({
          "name": name.text,
          "number": number.text,
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
    number.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text = widget.oldname;
    number.text = widget.oldnumber;
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
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: CustomTextField(
              hittext: "Enter the new name of state",
              addconroller: number,
            ),
          ),
          CustomButton(
              onPressed: () {
                editnumber();
              },
              title: "edit")
        ]),
      ),
    );
  }
}
