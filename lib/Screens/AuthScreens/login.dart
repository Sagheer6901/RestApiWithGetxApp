
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/Controllers/login_controller.dart';
import 'package:untitled1/Screens/home_page.dart';
import 'package:untitled1/Widgets/inputTextWidget.dart';
import 'package:untitled1/constants.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);
  final controller = Get.put(LoginController());
  final email = TextEditingController();
  final password = TextEditingController();
   static String p =
       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
   static RegExp regExp = new RegExp(p);

   Future vaildation() async {
     if (email.text.isEmpty && password.text.isEmpty) {
       Get.snackbar('!',"All Fleids Are Empty");
     } else if (email.text.isEmpty) {
       Get.snackbar('!',"Email Is Empty");
     } else if (!regExp.hasMatch(email.text.trim())) {

       Get.snackbar('!',"Email Is Not Vaild");
       Get.snackbar('!',"Password Is Empty");

     } else if (password.text.length < 3) {
       Get.snackbar('!',"Password Is Too Short");
     }
   }

   var h,w;
  @override
  Widget build(BuildContext context) {
    h =  MediaQuery.of(context).size.height;
    w =  MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: contentColor,
      body: Padding(
        padding:  EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height:h*0.15,),
                Center(
                  child: Image.asset("assets/images/logo.jpeg",width: w*0.35,),
                ),
                SizedBox(
                  height: 25.0,
                ),
                InputTextWidget(
                  controller: email,
                    labelText: "Email ",
                    icon: Icons.email,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress),
                SizedBox(
                  height: 25.0,
                ),
                Obx(() => Stack(
                  children:[ InputTextWidget(
                    controller: password,
                      labelText: "Password",
                      icon: Icons.lock,
                      obscureText: controller.isPasswordVisible.value,
                      keyboardType: TextInputType.text),
                    Positioned(
                      top: 5,
                      right: 10,
                        child: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: shadeColor,
                      ),
                      onPressed: () {
                        if(controller.isPasswordVisible.value==false){
                          controller.isPasswordVisible.value = true;
                        }
                        else{
                          controller.isPasswordVisible.value = false;
                        }
                      },
                    ))
                  ])),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 1),
                        )
                      ]),
                  child: Center(child: InkWell(
                      onTap: () async {
                        vaildation().then((_) async {
                          await controller.fetchUser(email.text).then((value) async {
                            print("${value[0]}  emailr");
                            if(value[0] == email.text.trim() && value[1]==password.text.trim()){
                              SharedPreferences prefs =await SharedPreferences.getInstance();
                              await prefs.setString('email',email.text);
                              await prefs.setString("userId", value[2].toString());
                              Get.to(()=>Homepage());
                              Get.snackbar("Login", "Successfully Login");
                            }
                            else{
                              Get.snackbar("Invalid", "Email or password is incorrect");
                            }
                          });                        });
                      },
                      child: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16,color: contentColor),))),
                )
              ],
            ),
        ),

      ),
    );
  }
}
