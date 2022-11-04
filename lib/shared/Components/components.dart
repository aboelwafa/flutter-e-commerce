// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, prefer_const_constructors, sort_child_properties_last, constant_identifier_names, dead_code, unused_local_variable, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


//  component to go name widget screen and back
void navigateTo(context,Widget)=> Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Widget,
    ),
  );

  // component to go name widget screen and not back
  void navigateAndFinish
  (context,Widget)=>
   Navigator.pushAndRemoveUntil(
    context,
   MaterialPageRoute(
    builder: (context) => Widget,
    ),
    (route) {
      return false;
    },
  );
  // reuable component to textFormField
  // 2-TextFormField
Widget defultFormField({
  required TextEditingController controller,
  String? Function(String?)? onSubmit,
  String? Function(String?)? onChanged,
 required String? Function(String?)? validate,
 required TextInputType type,
  required String label,
  required IconData prefix,
   IconData? suffix,
   Function()? suffixpress,
  bool ispassword=false,
})=>
 
 TextFormField(    

                         
  controller: controller,
  onFieldSubmitted:onSubmit,
 onChanged: onChanged,
 validator: validate,
 keyboardType: type,
 obscureText: ispassword,
 decoration: InputDecoration(
 labelText: label,
 prefixIcon: Icon(prefix),
    suffixIcon: suffix!=null? IconButton(
      onPressed: suffixpress,
      icon: Icon(
      Icons.remove_red_eye),
    )
  :null,
 border: OutlineInputBorder(),
                ),
                );  

// defaultButton
Widget defultButton({
  double width=double.infinity,
  Color background =Colors.blue ,
required void Function()? function, // Good
 required String text,
  double height=40.0,
 bool isUpperCase=true,
 double radius=5.0,
})=>
 Container(
  width: width,
  height: height,
  child: MaterialButton(
    onPressed:function,
    child:
     Text(
      isUpperCase?text.toUpperCase():text,
       style: TextStyle(
      color: Colors.white,
    ),),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
      color:background,

    ),

);
//TEXT BUTTON
// 
Widget defultTextButton({
  required Function()? function,
  required String text,
})=>
TextButton(onPressed: function, child: Text(text.toUpperCase()) );

// flutter toast msg 

void showToast({
  required String text,
  required Toaststate state,
})=>Fluttertoast.showToast(
msg: text,
toastLength: Toast.LENGTH_LONG,
gravity: ToastGravity.BOTTOM,
 timeInSecForIosWeb: 10,
backgroundColor:chooseToastcolor(state),
textColor: Colors.white,
fontSize: 20.0,
       );

      //  enum>> to swap color
enum Toaststate
{
  SUCCESS,
  ERROR,
  WARNING
}
// method change color
Color? chooseToastcolor(Toaststate state)
{ Color color;
  switch(state)
  {

    case Toaststate.SUCCESS:
    color= Colors.green;
    break;
    case Toaststate.ERROR:
    color= Colors.red;
    break;
    case Toaststate.WARNING:
    color= Colors.yellow;
    break;
  }
  return color;
}
      
Widget mydivider()=>Padding(
              padding: const EdgeInsetsDirectional.only(start: 20.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[500],
              ),
            );