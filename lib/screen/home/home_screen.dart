import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/global.dart';
import '../../utils/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  String path = "";
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        leading: const Icon(Icons.account_circle, size: 30),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SearchBar(
                hintText: "Search Your Contact", leading: Icon(Icons.search)),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: Global.l1.contactList.length,
                  itemBuilder: (context, index) {
                    Model get = Global.l1.contactList[index];
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'detail',
                                arguments: get);
                          },
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          FileImage(File("${get.image}")),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("${get.txtName}",
                                            style: const TextStyle(
                                                fontSize: 20)),
                                        Text("${get.txtMobile}",
                                            style: const TextStyle(
                                                fontSize: 15)),
                                      ],
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          Model u1 =
                                              Global.l1.contactList[index];
                                          txtName.text = u1.txtName!;
                                          txtMobile.text = u1.txtMobile!;
                                          txtEmail.text = u1.txtEmail!;
                                          path = u1.image!;
                                          editDialog(context, index);
                                        });
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          Global.l1.contactList.removeAt(index);
                                        });
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.pushNamed(context, 'add_data').then((value) {
              setState(() {});
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void editDialog(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Form(
              key: key,
              child: AlertDialog(title: Container(
              child:Column(
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
                              alignment: const Alignment(0.5, 0.5),
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
                              )),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: txtName,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "name is required";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter Name",
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: txtMobile,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "mobile no. is required";
                              } else if (value!.length != 10) {
                                return "Enter the valid number";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter Mobile Number",
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: txtEmail,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email is required ";
                              } else if (!RegExp(
                                      "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$")
                                  .hasMatch(value)) {
                                return "enter the valid email";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter Email id",
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (key.currentState!.validate()) {
                                    Model m1 = Model(
                                      txtName: txtName.text,
                                      txtMobile: txtMobile.text,
                                      txtEmail: txtEmail.text,
                                      image: path,
                                    );
                                    Global.l1.contactList[index] = Model(
                                        txtName: txtName.text,
                                        txtMobile: txtMobile.text,
                                        txtEmail: txtEmail.text,
                                        image: path);
                                  }
                                });

                                Navigator.pop(context);
                              },
                              child: const Text("update",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 25,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              )
          ),
            ),
          );
        });
  }
}
