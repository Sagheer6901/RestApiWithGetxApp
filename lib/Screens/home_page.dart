
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled1/Controllers/login_controller.dart';
import 'package:untitled1/Controllers/posts_controller.dart';
import 'package:untitled1/Screens/user_profile.dart';
import 'package:untitled1/Widgets/list_card.dart';
import 'package:untitled1/constants.dart';


class Homepage extends StatelessWidget {
  var h, w;
  final postController = Get.put(PostsController());
  final userController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light
      //color set to transperent or set your own color
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.dehaze,
              color: contentColor,
              size: 30,
            )),
        title: Text(
          "Lorem Ipsum",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: contentColor),
        ),
        actions: [
          Icon(
            Icons.search_outlined,
            color: contentColor,
            size: 30,
          ),
          SizedBox(width: 15,)
        ],
        bottom: TabBar(
            controller: postController.tabController,
            unselectedLabelColor: selectedTextColor,
            labelColor: unselectedTextColor,
            indicatorWeight: 5,
            indicatorColor: contentColor.withOpacity(0.8),
            tabs: <Widget>[
              Tab(
                child: Text(
                  "ALL POSTS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  "PROFILE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ]),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
                controller: postController.tabController, children: <Widget>[
              Obx(
                    () => ListView.builder(
                    itemCount: postController.postsList.length,
                    itemBuilder: (context, index) {
                      return ListCard("${postController.postsList[index].title}","${postController.postsList[index].body}","${postController.postsList[index].userId.toString()}");
                    }),
              ),
              Obx(
                ()=> ListView.builder(
                    itemCount: postController.userData.length,
                    itemBuilder: (context,index){
                      return Profile(postController.userData[index]);
                }),
              )

            ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}










