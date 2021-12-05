import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movies_list/Screen/home.dart';
import 'package:path/path.dart';

class AddMovies extends StatefulWidget {
  const AddMovies({Key? key}) : super(key: key);

  @override
  _AddMoviesState createState() => _AddMoviesState();
}

class _AddMoviesState extends State<AddMovies> {
  final TextEditingController directorName = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loadingScreen = false;
  final TextEditingController movieName = TextEditingController();
  final firebase = FirebaseFirestore.instance;
  final ImagePicker? _picker = ImagePicker();
  XFile? _imageFile;
  File? file;
  var fileName = '';
  var destination = '';
  var currentUser = FirebaseAuth.instance.currentUser;
  String url =
      "https://firebasestorage.googleapis.com/v0/b/movielist-8dc17.appspot.com/o/ml_logo.png?alt=media&token=461e3c32-11c3-467e-90d6-b945d634e5bd";

  addData() async {
    await firebase
        .collection("data")
        .doc(currentUser!.uid)
        .collection("data")
        .doc(movieName.text)
        .set({
      "name": movieName.text,
      "dName": directorName.text,
      "imageUrl": url,
    });
    var info = firebase
        .collection("data")
        .doc(currentUser!.uid)
        .collection("data")
        .snapshots();
    print(info);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Add Movie",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: movieName,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Theme.of(context).buttonColor,
                            ),
                          ),
                          hintText: "Enter Movie Name",
                          labelText: "Name",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter a Movie Name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: directorName,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Theme.of(context).buttonColor,
                            ),
                          ),
                          hintText: "Enter Director Name",
                          labelText: "Director",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Director name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () async {
                          await getImage();
                        },
                        child: const Text("Choose Image"),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: _imageFile == null
                            ? Image.asset(
                                "assets/images/ml_logo.png",
                                fit: BoxFit.fill,
                              )
                            : Image.file(File(_imageFile!.path)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Theme.of(context).canvasColor,
                                Theme.of(context).buttonColor,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(25)),
                        child: TextButton(
                          child: const Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await uploadImage();
                              await addData();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Theme.of(context).buttonColor,
                        height: 1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getImage() async {
    final XFile? pickedFile =
        await _picker?.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = pickedFile!;
      final path = _imageFile!.path;
      file = File(path);
    });
  }

  uploadImage() async {
    if (file == null) return;

    fileName = basename(file!.path);
    destination = fileName;
    final ref = FirebaseStorage.instance.ref(destination);
    TaskSnapshot uploadFile = await ref.putFile(file!);
    if (uploadFile.state == TaskState.success) {
      url = await ref.getDownloadURL();
    }
  }
}
