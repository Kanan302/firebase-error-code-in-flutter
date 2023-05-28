import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: iskele(),
    );
  }
}


class iskele extends StatefulWidget {
  const iskele({super.key});

  @override
  State<iskele> createState() => _iskeleState();
}

class _iskeleState extends State<iskele> {

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  
  addinformation(){
    FirebaseFirestore.instance
    .collection("numune")
    .doc(t1.text)
    .set({"basliq": t1.text, "icerik" : t2.text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(50),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: t1,
              ),
              TextField(
                controller: t2,
              ),
              
              Row(
                children: [
                  ElevatedButton(onPressed: addinformation, child: Text("add")),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: null, child: null),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: null, child: null),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: null, child: null),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}