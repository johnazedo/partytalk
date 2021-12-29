import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenSample extends StatefulWidget {
  const HomeScreenSample({Key? key}) : super(key: key);

  @override
  _HomeScreenSampleState createState() => _HomeScreenSampleState();
}

class _HomeScreenSampleState extends State<HomeScreenSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample"),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc("jplimao12@gmail.com")
            .collection("chats")
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text("Nothing");
            case ConnectionState.waiting:
              return const Text("Waiting");
            case ConnectionState.active:
              return StreamChats(docs: snapshot.data!.docs,);
            case ConnectionState.done:
              return const Text("Done");
          }
        },
      ),
    );
  }
}


class StreamChats extends StatelessWidget {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs;
  const StreamChats({Key? key, required this.docs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: docs.length,
      itemBuilder: (context, index) {
        DocumentReference docRef = docs[index].get("ref");
        return StreamBuilder<DocumentSnapshot<Object?>>(
            stream: docRef.snapshots(),
            builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Object?>> snapshot){
              switch(snapshot.connectionState){
                case ConnectionState.none:
                  return const Text("None");
                case ConnectionState.waiting:
                  return const Text("Waiting");
                case ConnectionState.active:
                  return Text(snapshot.data!.get("title").toString());
                case ConnectionState.done:
                  return const Text("Done");
              }
            }
        );
      },
    );
  }
}
