import 'package:flutter/material.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/appbar_widget.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/button_widget.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget().customAppBarWidget(title: 'Bankapp'),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: size.width * .03),
        child: Column(
          children: [
            Container(
                width: size.width,
                decoration: BoxDecoration(color: const Color(0xff003d51)),
                child: Center(
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.width * .035),
                        child: Text.rich(TextSpan(
                            style: TextStyle(
                                color: const Color(0xff0088b2),
                                fontSize: size.width * .04,
                                fontWeight: FontWeight.w600),
                            children: const [
                              TextSpan(
                                  text: 'Octavio Martinez ',
                                  style: TextStyle(color: Colors.white)),
                              TextSpan(text: '   '),
                              TextSpan(
                                  text: ' Último inicio 08/06/2021',
                                  style: TextStyle(color: Color(0xff00b689)))
                            ]))))),
            Padding(
                padding: EdgeInsets.symmetric(vertical: size.width * .02),
                child: SizedBox(
                    width: size.width * .95,
                    child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        alignment: WrapAlignment.start,
                        children: List.generate(
                            2,
                            (index) => ButtonWidget().underlineButton(
                                title: 'Mis cuentas',
                                color: const Color(0xff0088b2),
                                onTap: () {},
                                context: context))))),
            SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                        5,
                        (index) => CardWidget().showCardWidget(
                            title: 'Saldo General en cuentas',
                            money: '2,000.00',
                            context: context)))),
            SizedBox(height: size.width * .03),
            ButtonWidget().underlineButton(
                title: '+ Agregar una tarjeta de debito o crédito',
                color: const Color(0xff0088b2),
                onTap: () {},
                context: context),
            SizedBox(height: size.width * .03),
            Column(
              children: List.generate(
                  2,
                  (index) => CardWidget().creditCardWidget(
                      icon: Icons.credit_card,
                      status: 'Activa',
                      nameCard: 'Berenice García López',
                      numberCard: '5439340112341334',
                      money: '1,800.00',
                      context: context)),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.grey[200],
              child: SizedBox(
                width: size.width * .9,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: size.width * .02),
                  child: Column(
                    children: [
                      Column(
                        children: List.generate(
                            3,
                            (index) => CardWidget().recentMovesCardWidget(
                                title: 'UBER BV',
                                subtitle: '10/05/2021',
                                money: '250.00',
                                context: context)),
                      ),
                      SizedBox(height: size.width * .01),
                      InkWell(
                          borderRadius: BorderRadius.circular(5),
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.width * .01,
                                horizontal: size.width * .02),
                            child: Row(
                              children: [
                                const Icon(Icons.menu,
                                    color: Color(0xff0088b2)),
                                SizedBox(width: size.width * .02),
                                Text('Ver todos los movimientos',
                                    style: TextStyle(
                                        color: const Color(0xff0088b2),
                                        fontSize: size.width * .04,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
