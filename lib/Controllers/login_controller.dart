
import 'package:get/get.dart';
import 'package:untitled1/Services/services.dart';

class UserData{
 static int userId=0 ;
 static String name="" ;
 static String username="" ;
 static String useremail="";
 static String address ="";
 static String zipcode ="";
}
class LoginController extends GetxController {
 RxBool isPasswordVisible =true.obs;
 @override
 void onInit() async{
  // await fetchUser(useremail).then((value) {
  //  print("val ${value}");
  //  userData = value[0];
  // });
  super.onInit();
 } // RxString email = ''.obs;

 Future fetchUser(email)async{
  var r = await Services.loginUser(email);

  if(r != null){
   // SharedPreferences preferences = await SharedPreferences.getInstance();
   // preferences.setString("id", "${r[0]['id']}");
   // preferences.setString("username", "${r[0]['username']}");
   // preferences.setString("address", "${r[0]['address']['street']}, ${r[0]['address']['suite']}, ${r[0]['address']['city']}");

   // UserData.userId = r[0]['id'];
   // UserData.name = r[0]['name'];
   // UserData.username = r[0]['username'];
   // UserData.useremail = r[0]['email'];
   // UserData.address = "${r[0]['address']['street']}, ${r[0]['address']['suite']}, ${r[0]['address']['city']}";
   // UserData.zipcode = r[0]['address']['zipcode'];
   // update();
   // print("useremail :${UserData.useremail}");

   // List list = []
   return [r[0]['email'],r[0]['username'],r[0]['id']];
   // result = useremail;
   // print("output: ${r[0]['id']}");
   // print("result : ${userData['id']}");
   // result.value = userData;
  }
  update();

 }
}