
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/Services/services.dart';

class PostsController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;
  var postsList = [].obs;
  var userData = [].obs;
  var uid = '';
  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    getUseriId();
    fetchPosts();
    usersData();
    super.onInit();
  }

  void getUseriId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    uid= preferences.getString("userId")!;
    update();
  }
  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
  void usersData()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var uemail= preferences.getString("email");
    var data = await Services.loginUser(uemail);
    if(data != null){
      userData.assignAll(data);
    }
  }
  void fetchPosts() async {
    var posts = await Services.getAllPosts();
    if (posts != null) {
      postsList.value = posts;
    }
  }
}
