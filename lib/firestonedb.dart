import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreDemo extends StatefulWidget {
  const FirestoreDemo({Key? key}) : super(key: key);

  @override
  State<FirestoreDemo> createState() => _FirestoreDemoState();
}

class _FirestoreDemoState extends State<FirestoreDemo> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(data),
        const SizedBox(
          height: 5,
        ),
        TextButton(onPressed: createDoc, child: const Text("Create")),
        const SizedBox(
          height: 5,
        ),
        TextButton(onPressed: readall, child: const Text("Read")),
        const SizedBox(
          height: 5,
        ),
        TextButton(onPressed: readsingle, child: const Text("Read Single")),
        const SizedBox(
          height: 5,
        ),
        TextButton(onPressed: update, child: const Text("Update")),
        const SizedBox(
          height: 5,
        ),
        TextButton(onPressed: delete, child: const Text("Delete")),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Future<void> createDoc() {
    return users
        .add({'full_name': "Nishika", 'age': 20})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void readall() async {
    var record = await FirebaseFirestore.instance.collection("users").get();

    if (record.docs.isNotEmpty) {
      for (var doc in record.docs) {
        data = data + doc.data().values.toString();
      }
    }

    setState(() {});
  }

  void readsingle() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc("f4EGEimH1SgpeikHJwKk")
        .get()
        .then((value) => data = value.data().toString());

    setState(() {});
  }

  void update() async {
    users.doc("f4EGEimH1SgpeikHJwKk").set({"age": 19, "full_name": "Nishika"});
  }

  void delete() async {
    users.doc("f4EGEimH1SgpeikHJwKk").delete();
  }
}