import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_aids_app_pro1/Content%20management/CustomButton.dart';
import 'package:first_aids_app_pro1/Content%20management/CustomTextField.dart';
import 'package:flutter/material.dart';

class Add_Diseases extends StatefulWidget {
  const Add_Diseases({Key? key}) : super(key: key);

  @override
  State<Add_Diseases> createState() => _Add_Diseases();
}

class _Add_Diseases extends State<Add_Diseases> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  CollectionReference diseases =
      FirebaseFirestore.instance.collection("common-diseases");

  adddiseases() async {
    if (formState.currentState!.validate()) {
      try {
        await diseases.add({
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
              hittext: "Enter name of diseases",
              addconroller: name,
            ),
          ),
          CustomButton(
              onPressed: () {
                adddiseases();
              },
              title: "Add")
        ]),
      ),
    );
  }
}
