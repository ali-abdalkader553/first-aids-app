import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_aids_app_pro1/Content%20management/User/CustomButton.dart';
import 'package:first_aids_app_pro1/Content%20management/User/CustomButtonUpload.dart';
import 'package:first_aids_app_pro1/Content%20management/User/CustomTextField.dart';
import 'package:first_aids_app_pro1/screens/User/CommonDiseasesPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Edit_Diseases_Explanation extends StatefulWidget {
  final String diseasesexplanationdocid;
  final String commondiseasesid;
  final String value;

  const Edit_Diseases_Explanation(
      {Key? key,
      required this.diseasesexplanationdocid,
      required this.commondiseasesid,
      required this.value})
      : super(key: key);

  @override
  State<Edit_Diseases_Explanation> createState() =>
      _Edit_Diseases_Explanation();
}

class _Edit_Diseases_Explanation extends State<Edit_Diseases_Explanation> {
  File? file;
  String? url;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController explanation = TextEditingController();

  editdiseasesexplanation(context) async {
    CollectionReference diseases = FirebaseFirestore.instance
        .collection("common-diseases")
        .doc(widget.commondiseasesid)
        .collection("explanation");
    if (formState.currentState!.validate()) {
      try {
        setState(() {});

        await diseases
            .doc(widget.diseasesexplanationdocid)
            .update({"explanation": explanation.text, "url": url ?? "none"});
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
      var Imagename = basename(imagegallery!.path);
      var refStorge = FirebaseStorage.instance.ref("images").child(Imagename);
      await refStorge.putFile(file!);
      url = await refStorge.getDownloadURL();
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    explanation.text = widget.value;
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
              hittext: "Enter your edit for diseases",
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
                editdiseasesexplanation(context);
              },
              title: "Edit")
        ]),
      ),
    );
  }
}
