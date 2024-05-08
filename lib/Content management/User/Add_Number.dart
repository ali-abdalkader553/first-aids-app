import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_aids_app_pro1/Content%20management/User/CustomButton.dart';
import 'package:first_aids_app_pro1/Content%20management/User/CustomTextField.dart';
import 'package:flutter/material.dart';

class Add_Number extends StatefulWidget {
  const Add_Number({Key? key}) : super(key: key);

  @override
  State<Add_Number> createState() => _Add_Number_AidsState();
}

class _Add_Number_AidsState extends State<Add_Number> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  CollectionReference emergencynumber =
      FirebaseFirestore.instance.collection("emergency-number");

  addnumber() async {
    if (formState.currentState!.validate()) {
      try {
        await emergencynumber.add({
          "name": name.text,
          "number": number.text,
        });
        Navigator.pop(
          context,
        );
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
              hittext: "Enter the name ",
              addconroller: name,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: CustomTextField(
              hittext: "Enter the number",
              addconroller: number,
            ),
          ),
          CustomButton(
              onPressed: () {
                addnumber();
              },
              title: "Add")
        ]),
      ),
    );
  }
}
