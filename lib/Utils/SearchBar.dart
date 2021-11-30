import 'package:flutter/material.dart';
import 'package:flutter_app_multibashi/Constants/ColorConstants.dart';
import 'package:flutter_app_multibashi/main.dart';

Widget searchBar(
    {bool readonly,
    String hinttext,
    TextEditingController textEditController,
    TextInputAction keyboardaction,
    TextInputType keyBoardInputType,
    int maxlength,
    Function onTapped,
    Function onChange,
    Function onEditComplete}) {
  return TextFormField(
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.lightCreamColor,
      focusedBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.lightCreamColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.lightCreamColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        //borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.lightCreamColor,
        ),
      ),
      border: OutlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
          //borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
        width: 1,
        color: AppColors.lightCreamColor,
      )),
      focusedErrorBorder: OutlineInputBorder(
        //borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.lightCreamColor,
        ),
      ),
      prefixIcon: Icon(
        Icons.search,
        color: Colors.black,
        size: screenUtil.setSp(19.0),
        semanticLabel: "Search",
      ),
      hintText: hinttext,
      hintStyle: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: screenUtil.setSp(14.0),
      ),
    ),
    controller: textEditController,
    maxLength: maxlength,
    keyboardType: keyBoardInputType,
    onChanged: onChange,
    readOnly: readonly,
    obscureText: false,
    autofocus: false,
    cursorColor: Colors.grey,
    textInputAction: keyboardaction,
    onTap: onTapped,
    onEditingComplete: onEditComplete,
  );
}
