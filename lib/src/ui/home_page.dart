import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_bankapp_android_endcom/src/models/credit_card_model.dart';
import 'package:test_bankapp_android_endcom/src/models/movement_model.dart';
import 'package:test_bankapp_android_endcom/src/services/bankapp_service.dart';
import 'package:test_bankapp_android_endcom/src/ui/form_page.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/appbar_widget.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/button_widget.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBarWidget().customAppBarWidget(title: 'Bankapp'),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: size.width * .03),
            child: Column(children: [
              FutureBuilder<Response>(
                  future: BankService().getAccount(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Response> snapShot) {
                    switch (snapShot.connectionState) {
                      case ConnectionState.waiting:
                        return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.width * .05),
                            child: SizedBox(
                                child: Column(children: [
                              customCircularProgressIndicator(),
                            ])));
                      default:
                        if (snapShot.hasError) {
                          return Text('error');
                        } else {
                          return Container(
                              width: size.width,
                              decoration:
                                  const BoxDecoration(color: Color(0xff003d51)),
                              child: Center(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.width * .035),
                                      child: Text.rich(TextSpan(
                                          style: TextStyle(
                                              color: const Color(0xff0088b2),
                                              fontSize: size.width * .04,
                                              fontWeight: FontWeight.w600),
                                          children: [
                                            TextSpan(
                                                text: snapShot
                                                        .data!.data['cuenta'][0]
                                                    ['nombre'],
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                            const TextSpan(text: '   '),
                                            TextSpan(
                                                text:
                                                    'Último inicio ${snapShot.data!.data['cuenta'][0]['ultimaSesion']}',
                                                style: const TextStyle(
                                                    color: Color(0xff00b689)))
                                          ])))));
                        }
                    }
                  }),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: size.width * .02),
                  child: SizedBox(
                      width: size.width * .95,
                      child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          alignment: WrapAlignment.start,
                          children: [
                            ButtonWidget().underlineButton(
                                title: 'Mis cuentas',
                                color: const Color(0xff0088b2),
                                onTap: () {},
                                context: context),
                            ButtonWidget().underlineButton(
                                title: 'Enviar Dinero',
                                color: Colors.black.withOpacity(.6),
                                onTap: () {},
                                context: context)
                          ]))),
              FutureBuilder<Response>(
                  future: BankService().getBalance(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Response> snapShot) {
                    switch (snapShot.connectionState) {
                      case ConnectionState.waiting:
                        return customCircularProgressIndicator();
                      default:
                        if (snapShot.hasError) {
                          return Text('error');
                        } else {
                          return SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(children: [
                                CardWidget().showCardWidget(
                                    title: 'Saldo general en cuentas',
                                    money: snapShot
                                        .data!.data['saldos'][0]['saldoGeneral']
                                        .toString(),
                                    context: context),
                                CardWidget().showCardWidget(
                                    title: 'Total de ingresos',
                                    money: snapShot
                                        .data!.data['saldos'][0]['ingresos']
                                        .toString(),
                                    context: context),
                                CardWidget().showCardWidget(
                                    title: 'Total de gastos',
                                    money: snapShot
                                        .data!.data['saldos'][0]['gastos']
                                        .toString(),
                                    context: context)
                              ]));
                        }
                    }
                  }),
              SizedBox(height: size.width * .03),
              ButtonWidget().underlineButton(
                  title: '+ Agregar una tarjeta de debito o crédito',
                  color: const Color(0xff0088b2),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormPage())),
                  context: context),
              SizedBox(height: size.width * .03),
              FutureBuilder<Response>(
                  future: BankService().getCards(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Response> snapShot) {
                    switch (snapShot.connectionState) {
                      case ConnectionState.waiting:
                        return customCircularProgressIndicator();
                      default:
                        if (snapShot.hasError) {
                          return Text('error');
                        } else {
                          List<CreditCard> creditCardList =
                              (snapShot.data!.data['tarjetas'] as List)
                                  .map((e) => CreditCard.fromJson(e))
                                  .toList();
                          return Column(
                              children: List.generate(
                                  creditCardList.length,
                                  (index) => CardWidget().creditCardWidget(
                                      icon: Icons.credit_card,
                                      status: creditCardList[index].status!,
                                      nameCard: creditCardList[index].name!,
                                      numberCard: creditCardList[index]
                                          .number!
                                          .toString(),
                                      money: creditCardList[index]
                                          .balance!
                                          .toString(),
                                      type: creditCardList[index].type!,
                                      context: context)));
                        }
                    }
                  }),
              SizedBox(height: size.width * .02),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.grey[200],
                  child: SizedBox(
                      width: size.width * .9,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: size.width * .02),
                          child: Column(children: [
                            FutureBuilder<Response>(
                                future: BankService().getMovements(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<Response> snapShot) {
                                  switch (snapShot.connectionState) {
                                    case ConnectionState.waiting:
                                      return customCircularProgressIndicator();
                                    default:
                                      if (snapShot.hasError) {
                                        return Text('error');
                                      } else {
                                        List<Movement> movementList = (snapShot
                                                .data!
                                                .data['movimientos'] as List)
                                            .map((e) => Movement.fromJson(e))
                                            .toList();
                                        return Column(
                                            children: List.generate(
                                                movementList.length,
                                                (index) => CardWidget()
                                                    .recentMovesCardWidget(
                                                        title:
                                                            movementList[index]
                                                                .description!,
                                                        subtitle:
                                                            movementList[index]
                                                                .date!,
                                                        money:
                                                            movementList[index]
                                                                .amount!
                                                                .toString(),
                                                        type:
                                                            movementList[index]
                                                                .type!,
                                                        context: context)));
                                      }
                                  }
                                }),
                            SizedBox(height: size.width * .01),
                            InkWell(
                                borderRadius: BorderRadius.circular(5),
                                onTap: () {},
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.width * .01,
                                        horizontal: size.width * .02),
                                    child: Row(children: [
                                      const Icon(Icons.menu,
                                          color: Color(0xff0088b2)),
                                      SizedBox(width: size.width * .02),
                                      Text('Ver todos los movimientos',
                                          style: TextStyle(
                                              color: const Color(0xff0088b2),
                                              fontSize: size.width * .04,
                                              fontWeight: FontWeight.w600))
                                    ])))
                          ]))))
            ])));
  }

  customCircularProgressIndicator() {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.symmetric(vertical: size.width * .05),
        child: SizedBox(
            child: Column(children: const [
          CircularProgressIndicator(color: Color(0xff00b689)),
        ])));
  }
}
