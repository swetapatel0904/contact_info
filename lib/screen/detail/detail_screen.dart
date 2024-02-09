import 'dart:io';

import 'package:contact_info/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:contact_info/utils/model.dart';
import 'package:image_picker/image_picker.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Model? m1;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  String? path;

  @override
  Widget build(BuildContext context) {
    m1 = ModalRoute.of(context)!.settings.arguments as Model;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
        centerTitle: true,
      ),
      body: Container(
          height: 200,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.cyanAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: FileImage(File("${m1?.image}")),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Name:", style: TextStyle(fontSize: 20)),
                Text("${m1?.txtName}", style: const TextStyle(fontSize: 20)),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Mobile Number:", style: TextStyle(fontSize: 20)),
                Text("${m1?.txtMobile}", style: const TextStyle(fontSize: 20)),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Email id:", style: TextStyle(fontSize: 20)),
                Text("${m1?.txtEmail}", style: const TextStyle(fontSize: 20)),
              ]),
              Center(
                child: FloatingActionButton(
                  onPressed: (){
                    setState(() {

                    });
                  },
                  child: Text("Edit"),
                ),
              ),
              Center(
                child: FloatingActionButton(
                  onPressed: (){
                    setState(() {

                    });
                  },
                  child: Text("Delete"),
                ),
              ),
            ],
          )),
    );
  }
}
