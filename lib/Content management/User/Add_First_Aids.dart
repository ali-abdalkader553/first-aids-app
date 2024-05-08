import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_aids_app_pro1/Content%20management/User/CustomButton.dart';
import 'package:first_aids_app_pro1/Content%20management/User/CustomTextField.dart';
import 'package:flutter/material.dart';

class Add_First_Aids extends StatefulWidget {
  const Add_First_Aids({Key? key}) : super(key: key);

  @override
  State<Add_First_Aids> createState() => _Add_First_AidsState();
}

class _Add_First_AidsState extends State<Add_First_Aids> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  CollectionReference firstaids =
      FirebaseFirestore.instance.collection("first-aids");

  addfirstaids() async {
    if (formState.currentState!.validate()) {
      try {
        await firstaids.add({
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
              hittext: "Enter name of state",
              addconroller: name,
            ),
          ),
          CustomButton(
              onPressed: () {
                addfirstaids();
              },
              title: "Add")
        ]),
      ),
    );
  }
}
