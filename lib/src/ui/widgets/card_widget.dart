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
                          width: size.width * .4,
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
      required BuildContext context}) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Icon(icon, size: size.width * .1),
          SizedBox(
              width: size.width * .6,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .04),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: size.width * .02),
                            child: Text(status,
                                style: TextStyle(
                                    color: const Color(0xff00b689),
                                    fontSize: size.width * .04,
                                    fontWeight: FontWeight.w600))),
                        Padding(
                            padding: EdgeInsets.only(bottom: size.width * .02),
                            child: Text(numberCard,
                                style: TextStyle(
                                    fontSize: size.width * .05,
                                    fontWeight: FontWeight.w600))),
                        Padding(
                            padding: EdgeInsets.only(bottom: size.width * .02),
                            child: Text(nameCard,
                                style: TextStyle(
                                    fontSize: size.width * .035,
                                    fontWeight: FontWeight.w500))),
                        Text('Titular',
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
      required BuildContext context}) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .9,
      child: ListTile(
        leading: null,
        title: Text(title,
            style: TextStyle(
                fontSize: size.width * .035, fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle,
            style: TextStyle(
                fontSize: size.width * .032, fontWeight: FontWeight.w600)),
        trailing: Text('\$$money',
            style: TextStyle(
                fontSize: size.width * .035, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
