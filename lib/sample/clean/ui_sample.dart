import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talk/sample/clean/repository_sample.dart';
import 'package:talk/sample/clean/usecase_sample.dart';

class UISample extends StatefulWidget {
  const UISample({Key? key}) : super(key: key);

  @override
  _UISampleState createState() => _UISampleState();
}

class _UISampleState extends State<UISample> {
  var useCase = UseCaseImpl(repository: RepositoryImpl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample"),
      ),
      body: StreamBuilder<List<DocumentReference>>(
        stream: useCase("jplimao12@gmail.com"),
        builder: (BuildContext context,
            AsyncSnapshot<List<DocumentReference>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text("Nothing");
            case ConnectionState.waiting:
              return const Text("Waiting");
            case ConnectionState.active:
              return StreamChats(docs: snapshot.data!,);
            case ConnectionState.done:
              return const Text("Done");
          }
        },
      ),
    );
  }
}


class StreamChats extends StatelessWidget {
  final List<DocumentReference> docs;
  const StreamChats({Key? key, required this.docs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: docs.length,
      itemBuilder: (context, index) {
        DocumentReference docRef = docs[index];
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
