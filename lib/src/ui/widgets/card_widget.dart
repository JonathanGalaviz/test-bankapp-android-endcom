import 'package:flutter/material.dart';

class CardWidget {
  showCardWidget(
      {required String title,
      required String money,
      required BuildContext context}) {
    Size size = MediaQuery.of(context).size;
    return Card(
        color: const Color(0xff003d51),
        child: SizedBox(
            width: size.width * .7,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.width * .04, horizontal: size.width * .05),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: size.width * .3,
                          child: Text(title,
                              style: TextStyle(
                                  color: const Color(0xff0088b2),
                                  fontSize: size.width * .045,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.start)),
                      SizedBox(height: size.width * .08),
                      SizedBox(
                          width: size.width * .7,
                          child: Text('\$$money',
                              style: TextStyle(
                                  color: const Color(0xff00b689),
                                  fontSize: size.width * .05,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.end))
                    ]))));
  }

  creditCardWidget(
      {required IconData icon,
      required String status,
      required String nameCard,
      required String numberCard,
      required String money,
      required String type,
      required BuildContext context}) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.symmetric(vertical: size.width * .01),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon,
                  size: size.width * .1,
                  color: status == 'activa'
                      ? const Color(0xff00b689)
                      : const Color(0xff57BBA2).withOpacity(.6)),
              SizedBox(
                  width: size.width * .6,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .04),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(bottom: size.width * .02),
                                child: Text(status,
                                    style: TextStyle(
                                        color: const Color(0xff00b689),
                                        fontSize: size.width * .04,
                                        fontWeight: FontWeight.w600))),
                            Padding(
                                padding:
                                    EdgeInsets.only(bottom: size.width * .01),
                                child: Text(numberCard,
                                    style: TextStyle(
                                        fontSize: size.width * .045,
                                        fontWeight: FontWeight.w600))),
                            Padding(
                                padding:
                                    EdgeInsets.only(bottom: size.width * .01),
                                child: Text(nameCard,
                                    style: TextStyle(
                                        fontSize: size.width * .035,
                                        fontWeight: FontWeight.w500))),
                            Text(type,
                                style: TextStyle(
                                    fontSize: size.width * .03,
                                    fontWeight: FontWeight.w500))
                          ]))),
              SizedBox(
                  width: size.width * .2,
                  child: Text('\$$money',
                      style: TextStyle(
                          fontSize: size.width * .042,
                          fontWeight: FontWeight.w600)))
            ]));
  }

  recentMovesCardWidget(
      {required String title,
      required String subtitle,
      required String money,
      required String type,
      required BuildContext context}) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .9,
      child: Column(
        children: [
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            leading: null,
            dense: true,
            title: Text(title,
                style: TextStyle(
                    fontSize: size.width * .03, fontWeight: FontWeight.w600)),
            subtitle: Text(subtitle,
                style: TextStyle(
                    fontSize: size.width * .028, fontWeight: FontWeight.w600)),
            trailing: Text('\$$money',
                style: TextStyle(
                    fontSize: size.width * .028,
                    color: type == 'abono' ? Colors.green : Colors.redAccent,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
              width: size.width * .85,
              child: const Divider(
                height: 1,
              ))
        ],
      ),
    );
  }
}
