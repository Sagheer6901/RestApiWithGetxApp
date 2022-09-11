
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Controllers/posts_controller.dart';
import 'package:untitled1/constants.dart';

class ListCard extends StatelessWidget {
  var title,desc,id;
  final postController = Get.put(PostsController());

  ListCard(this.title,this.desc,this.id);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        ListTile(
          title: Text("$title", style: postController.uid.toString() == id?TextStyle(fontWeight:FontWeight.w500,fontSize: 18,color: primaryColor ):TextStyle(fontWeight:FontWeight.w500,fontSize: 18, ),),
          subtitle: Text("$desc", style: postController.uid.toString() == id?TextStyle(fontWeight:FontWeight.w500,fontSize: 16, ):TextStyle(fontWeight:FontWeight.w400,fontSize: 16, color: shadeColor)),

        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0,bottom: 10,left: 15,right: 15),
          child: Divider(
            thickness: 1,
          ),
        )
      ],
    );
  }
}
