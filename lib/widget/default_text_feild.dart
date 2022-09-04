import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextFeild extends StatelessWidget{

  final String text;
  final  TextEditingController controller;
  final  TextInputType keyboardType;
  final Icon icon;
  final IconButton iconButton;

  final Function validate;
  final Function onChange;
  final Function onTaped;


  DefaultTextFeild({this.text,this.iconButton,this.controller,this.keyboardType,
    this.icon,this.validate,this.onChange,this.onTaped});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 2)]
      ),
      child: TextFormField(
        onTap: onTaped,
        controller: controller,
        keyboardType:keyboardType ,
        onChanged: onChange,
        decoration: InputDecoration(
          labelText: text,
          prefixIcon:icon ,
          suffixIcon: iconButton,
          filled: true,
          labelStyle:TextStyle(color: Color(0xff103176 ),
              fontSize: 20,fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff103176 )),
            borderRadius: BorderRadius.circular(10.0),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:  Color(0xff103176 )),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),          fillColor: Color(0xffFFF9FC    ),
          focusColor: Color(0xffFFF9FC  ),
        ),
        validator: validate,
        cursorColor:  Color(0xff103176 ),

      ),
    );
  }
}