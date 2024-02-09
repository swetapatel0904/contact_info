import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/global.dart';
import '../../utils/model.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {

  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  String? path = "";
  GlobalKey<FormState>key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Add Data Screen"),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20),
                    height: MediaQuery.sizeOf(context).height * 0.30,
                    width: MediaQuery.sizeOf(context).width * 0.85,
                    color: Colors.white,
                    child: Stack(alignment: Alignment.center, children: [
                      path == null
                          ? const CircleAvatar(
                        radius: 90,
                      )
                          : CircleAvatar(
                        radius: 90,
                        backgroundImage: FileImage(File(path!)),
                      ),
                      Align(
                          alignment: Alignment(0.5, 0.5),
                          child: IconButton(
                            onPressed: () async {
                              ImagePicker picker = ImagePicker();
                              XFile? image = await picker.pickImage(
                                  source: ImageSource.camera);
                              setState(() {
                                path = image!.path;
                              });
                            },
                            icon: const Icon(
                              Icons.add_a_photo_rounded,
                              color: Colors.blueAccent,
                              weight: 50,
                            ),
                          )
                      ),
                    ]
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: txtName,
                        validator: (value) {
                          if (value!.isEmpty)
                          {
                            return "name is required";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter Name", border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: txtMobile,
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "mobile no. is required";
                          }
                          else if (value!.length!=10)
                          {
                            return "Enter the valid number";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter Mobile Number", border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: txtEmail,
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "Email is required ";
                          }
                          else if(!RegExp("^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$").hasMatch(value))
                          {
                            return "enter the valid email";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter Email id", border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if(key.currentState!.validate()) {
                              Model m1 = Model(
                                txtName: txtName.text,
                                txtMobile: txtMobile.text,
                                txtEmail: txtEmail.text,
                                image: path,
                              );
                              Global.l1.contactList.add(m1);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("submit",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 25,
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
