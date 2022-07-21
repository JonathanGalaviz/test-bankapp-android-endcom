import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/button_widget.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/card_widget.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/input_widget.dart';

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
      appBar: AppBar(
        title: Text('Bankapp'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  CardWidget().showCardWidget(
                      title: 'Saldo General en cuentas',
                      money: '2,000.00',
                      context: context),
                ],
              ),
            ),
            CardWidget().creditCardWidget(
                icon: Icons.credit_card,
                status: 'Activa',
                nameCard: 'Berenice García López',
                numberCard: '5439340112341334',
                money: '1,800.00',
                context: context),
            CardWidget().recentMovesCardWidget(
                title: 'UBER BV',
                subtitle: '10/05/2021',
                money: '250.00',
                context: context),
            ButtonWidget().showButton(
                title: 'Agregar',
                color: const Color(0xff00b689),
                onTap: () {},
                context: context),
            InputWidget(
              textInputFormatter: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              maxLength: 10,
              controller: TextEditingController(),
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              valueSize: .8,
              text: 'Celular',
            ),
          ],
        ),
      ),
    );
  }
}
