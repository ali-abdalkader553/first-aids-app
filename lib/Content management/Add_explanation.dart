import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_aids_app_pro1/Content%20management/CustomButton.dart';
import 'package:first_aids_app_pro1/Content%20management/CustomTextField.dart';
import 'package:first_aids_app_pro1/screens/FirstAidsPage.dart';
import 'package:first_aids_app_pro1/screens/HomePage.dart';
import 'package:flutter/material.dart';


class Add_Explanation extends StatefulWidget {
  final String docid;
  const Add_Explanation({Key? key, required this.docid}) : super(key: key);

  @override
  State<Add_Explanation> createState() => _Add_ExplanationState();
}

class _Add_ExplanationState extends State<Add_Explanation> {

  GlobalKey<FormState> formState =GlobalKey<FormState>();

  TextEditingController explanation=TextEditingController();



  addexplanation () async{
    CollectionReference firstaids = FirebaseFirestore.instance.collection("first-aids")
    .doc(widget.docid).collection("explanation");
    if(formState.currentState!.validate()) {
      try{
        await firstaids.add({"explanation":explanation.text ,} );
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FirstAidPage())
        );
      }
      catch (e){
        print("Error  $e");

      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    explanation.dispose();
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
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 25),
            child: CustomTextField(hittext: "Enter the explanation",
              addconroller: explanation,

            ),
          ),
          CustomButton(onPressed: (){
            addexplanation();
          },
              title: "Add")

        ]),

      ),

    );
  }
}
