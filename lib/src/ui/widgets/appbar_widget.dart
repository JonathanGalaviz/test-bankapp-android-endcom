import 'package:flutter/material.dart';

class AppBarWidget {
  customAppBarWidget({required String title}) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Color(0xff00b689)),
        title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.circle_outlined, color: Color(0xff00b689)),
              SizedBox(width: 5),
              Text('Bankapp',
                  style: TextStyle(
                      color: Color(0xff00b689), fontWeight: FontWeight.w600))
            ]),
        centerTitle: true);
  }
}
