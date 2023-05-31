
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:uuid/uuid.dart';


class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {

  File? imageFile;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final CollectionReference _productRef = FirebaseFirestore.instance.collection("status");

  Future getImage() async {
    ImagePicker _picker = ImagePicker();

    await _picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imageFile = File(xFile.path);
        uploadImage();
      }
    });
  }

  Future uploadImage() async {
    String fileName = Uuid().v1();
    int status = 1;

    await _firestore
        .collection('status')
        .doc(fileName)
        .set({
      "urls": "",
    });
    var ref =
    FirebaseStorage.instance.ref().child('status').child("$fileName.jpg");

    var uploadTask = await ref.putFile(imageFile!).catchError((error) async {
      await _firestore
          .collection('status')
          .doc(fileName)
          .delete();

      status = 0;
    });

    if (status == 1) {
      String imageUrl = await uploadTask.ref.getDownloadURL();

      await _firestore
          .collection('status')
          .doc(fileName)
          .update({"urls": imageUrl});
      _showToast(context);
      print(imageUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add status"),
        backgroundColor: Color(0xff005AA6),
      ),
      body: Container(
          child: RefreshIndicator(
            color: Color(0xff005AA6),
            onRefresh: () async {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Status()

              ));
            },
            child:  Stack(
              children: [
                FutureBuilder<QuerySnapshot>(
                  future: _productRef.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Scaffold(
                        body: Center(
                          child: Text("Error : ${snapshot.error}"),
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView(
                        children: snapshot.data!.docs.map((document) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 8.0,
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: CachedNetworkImage(
                                        imageUrl: "${document['urls']}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                  ],
                                )
                            ),
                          );
                        },).toList(),
                      );
                    }
                    return Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(color: Color(0xff005AA6)),
                      ),
                    );
                  },
                ),

              ],
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff005AA6),
        child: Icon(Icons.add),
        onPressed: (){
          getImage();

        },
      ),
    );
  }
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Uploaded Sucessfully'),
      ),
    );
  }
}
