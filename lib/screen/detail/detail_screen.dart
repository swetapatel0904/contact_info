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
  Model? get;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  String? path;

  @override
  Widget build(BuildContext context) {
    get = ModalRoute.of(context)!.settings.arguments as Model;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Person Detail "),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 35,
                backgroundImage: FileImage(File("${get?.image}")),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("${get?.txtName}",style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10,),
            Text("${get?.txtMobile}",style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                   children: [IconButton(onPressed:(){}, icon: const Icon(Icons.call,size: 30,color: Colors.blue
                   )
                   ),
                     const Text("Call",style: const TextStyle(fontSize: 20))
                   ],
                 ),
                 Column(
                   children: [IconButton(onPressed:(){}, icon: const Icon(Icons.textsms,size: 30,color: Colors.green
                   )
                   ),
                     const Text("Text",style: const TextStyle(fontSize: 20))
                   ],
                 ),
                 Column(
                   children: [IconButton(onPressed:(){}, icon: const Icon(Icons.video_call,size: 30,color: Colors.pinkAccent
                   )
                   ),
                     const Text("Video",style: const TextStyle(fontSize: 20))
                   ],
                 ),
                 Column(
                   children: [IconButton(onPressed:(){}, icon: const Icon(Icons.email,size: 30,color: Colors.orange
                   )
                   ),
                     const Text("Email",style: const TextStyle(fontSize: 20))
                   ],
                 ),
               ],
             ),
            SizedBox(height: 20,),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.account_circle),
                    SizedBox(width: 10,),
                    Text("${get?.txtName}",style: TextStyle(fontSize: 20,),)],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 10,),
                    Text("${get?.txtMobile}",style: TextStyle(fontSize: 20,),)],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 10,),
                    Text("${get?.txtEmail}",style: TextStyle(fontSize: 20,),)],
                ),
              ],
            )
      ]
    )
      )
    );
  }
}
