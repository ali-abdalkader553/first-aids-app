import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_aids_app_pro1/Content%20management/CustomButton.dart';
import 'package:first_aids_app_pro1/Content%20management/CustomButtonUpload.dart';
import 'package:first_aids_app_pro1/Content%20management/CustomTextField.dart';
import 'package:first_aids_app_pro1/screens/CommonDiseasesPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Add_Diseases_Explanation extends StatefulWidget {
  final String docid;
  const Add_Diseases_Explanation({Key? key, required this.docid})
      : super(key: key);

  @override
  State<Add_Diseases_Explanation> createState() => _Add_Diseases_Explanation();
}

class _Add_Diseases_Explanation extends State<Add_Diseases_Explanation> {
  File? file;
  String? url;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController explanation = TextEditingController();

  adddiseasesexplanation(context) async {
    CollectionReference diseases = FirebaseFirestore.instance
        .collection("common-diseases")
        .doc(widget.docid)
        .collection("explanation");
    if (formState.currentState!.validate()) {
      try {
        await diseases
            .add({"explanation": explanation.text, "url": url ?? "none"});
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CommonDiseasesPage()));
      } catch (e) {
        print("Error  $e");
      }
    }
  }

  getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagegallery =
        await picker.pickImage(source: ImageSource.gallery);
    if (imagegallery != null) {
      file = File(imagegallery!.path);
      var imagename = basename(imagegallery!.path);
      var refStorge = FirebaseStorage.instance.ref("images").child(imagename);
      await refStorge.putFile(file!);
      url = await refStorge.getDownloadURL();
    }
    setState(() {});
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
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: CustomTextField(
              hittext: "Enter the disease explanation",
              addconroller: explanation,
            ),
          ),
          CustomButtonUpload(
              onPressed: () async {
                await getImage();
              },
              title: "Upload image",
              isSelected: url == null ? false : true),
          CustomButton(
              onPressed: () {
                adddiseasesexplanation(context);
              },
              title: "Add")
        ]),
      ),
    );
  }
}
