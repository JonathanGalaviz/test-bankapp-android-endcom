import 'package:flutter/material.dart';

class ButtonWidget {
  showButton(
      {required String title,
      required Color color,
      required Function() onTap,
      required BuildContext context}) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .075, vertical: size.width * .035),
          textStyle: TextStyle(
              fontSize: size.width * .035, fontWeight: FontWeight.w600)),
      child: Text(title),
    );
  }

  underlineButton(
      {required String title,
      required Color color,
      required Function() onTap,
      required BuildContext context}) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.width * .01, horizontal: size.width * .02),
          child: Text(title,
              style: TextStyle(
                  color: color,
                  fontSize: size.width * .04,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline)),
        ));
  }
}
