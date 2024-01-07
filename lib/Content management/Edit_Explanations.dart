import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_aids_app_pro1/Content%20management/CustomButton.dart';
import 'package:first_aids_app_pro1/Content%20management/CustomButtonUpload.dart';
import 'package:first_aids_app_pro1/Content%20management/CustomTextField.dart';
import 'package:first_aids_app_pro1/screens/DataStateOfExplanations.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Edit_Explanation extends StatefulWidget {
  final String explanationdocid;
  final String firstaidid;
  final String value;

  const Edit_Explanation(
      {Key? key,
      required this.explanationdocid,
      required this.firstaidid,
      required this.value})
      : super(key: key);

  @override
  State<Edit_Explanation> createState() => _Edit_Explanation();
}

class _Edit_Explanation extends State<Edit_Explanation> {
  File? file;
  String? url;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController explanation = TextEditingController();

  editexplanation(context) async {
    CollectionReference firstaids = FirebaseFirestore.instance
        .collection("first-aids")
        .doc(widget.firstaidid)
        .collection("explanation");
    if (formState.currentState!.validate()) {
      try {
        setState(() {});

        await firstaids
            .doc(widget.explanationdocid)
            .update({"explanation": explanation.text, "url": url ?? "none"});
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DataStateOfExplanations(firstaidid: widget.firstaidid)));
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
              hittext: "Enter the explanation",
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
                editexplanation(context);
              },
              title: "Edit")
        ]),
      ),
    );
  }
}
