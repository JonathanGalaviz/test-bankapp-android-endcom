import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/appbar_widget.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/button_widget.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/input_widget.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController numberCardController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController issureController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBarWidget().customAppBarWidget(title: 'Bankapp'),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: size.width * .1),
              child: Column(children: [
                Icon(
                  Icons.credit_card,
                  size: size.width * .1,
                  color: const Color(0xff00b689),
                ),
                SizedBox(height: size.width * .03),
                Text('Asociar Tarjeta',
                    style: TextStyle(fontSize: size.width * .05))
              ])),
          InputWidget(
              textInputFormatter: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              maxLength: 16,
              controller: numberCardController,
              textCapitalization: TextCapitalization.none,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              valueSize: .85,
              text: 'Número de tarjeta'),
          SizedBox(
              width: size.width * .85,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputWidget(
                        controller: accountController,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        valueSize: .4,
                        text: 'Cuenta'),
                    InputWidget(
                        controller: issureController,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        valueSize: .4,
                        text: 'Issure')
                  ])),
          SizedBox(height: size.width * .02),
          InputWidget(
              controller: nameController,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              valueSize: .85,
              text: 'Nombre de tarjeta'),
          SizedBox(height: size.width * .03),
          InputWidget(
              controller: brandController,
              textCapitalization: TextCapitalization.none,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              valueSize: .85,
              text: 'Marca'),
          SizedBox(height: size.width * .03),
          SizedBox(
              width: size.width * .85,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputWidget(
                        controller: statusController,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        valueSize: .4,
                        text: 'Estatus'),
                    InputWidget(
                        controller: issureController,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        valueSize: .4,
                        text: 'Saldo')
                  ])),
          SizedBox(height: size.width * .03),
          InputWidget(
              controller: accountTypeController,
              textCapitalization: TextCapitalization.none,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              valueSize: .85,
              text: 'Tipo de cuenta'),
          SizedBox(height: size.width * .2),
          SizedBox(
              width: size.width * .9,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonWidget().showButton(
                        title: 'Cancelar',
                        color: Colors.grey,
                        onTap: () => Navigator.pop(context),
                        context: context),
                    ButtonWidget().showButton(
                        title: 'Agregar',
                        color: const Color(0xff00b689),
                        onTap: () {},
                        context: context)
                  ]))
        ])));
  }
}
