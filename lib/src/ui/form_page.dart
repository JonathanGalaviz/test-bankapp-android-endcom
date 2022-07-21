import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_bankapp_android_endcom/src/models/new_credit_card_model.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/appbar_widget.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/button_widget.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/input_widget.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController numberCardController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController issureController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();

  @override
  void dispose() {
    numberCardController.dispose();
    accountController.dispose();
    issureController.dispose();
    nameController.dispose();
    brandController.dispose();
    statusController.dispose();
    balanceController.dispose();
    accountTypeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

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
          Form(
              key: key,
              child: Column(children: [
                InputWidget(
                    textInputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 16,
                    validator: (String? value) =>
                        numberCardController.text.isEmpty ? "" : null,
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
                              validator: (String? value) =>
                                  accountController.text.isEmpty ? "" : null,
                              controller: accountController,
                              textCapitalization: TextCapitalization.words,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              valueSize: .4,
                              text: 'Cuenta'),
                          InputWidget(
                              validator: (String? value) =>
                                  issureController.text.isEmpty ? "" : null,
                              controller: issureController,
                              textCapitalization: TextCapitalization.words,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              valueSize: .4,
                              text: 'Issure')
                        ])),
                SizedBox(height: size.width * .02),
                InputWidget(
                    validator: (String? value) =>
                        nameController.text.isEmpty ? "" : null,
                    controller: nameController,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    valueSize: .85,
                    text: 'Nombre de tarjeta'),
                SizedBox(height: size.width * .03),
                InputWidget(
                    validator: (String? value) =>
                        brandController.text.isEmpty ? "" : null,
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
                              validator: (String? value) =>
                                  statusController.text.isEmpty ? "" : null,
                              controller: statusController,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              valueSize: .4,
                              text: 'Estatus'),
                          InputWidget(
                              validator: (String? value) =>
                                  balanceController.text.isEmpty ? "" : null,
                              controller: balanceController,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              valueSize: .4,
                              text: 'Saldo')
                        ])),
                SizedBox(height: size.width * .03),
                InputWidget(
                    validator: (String? value) =>
                        accountTypeController.text.isEmpty ? "" : null,
                    controller: accountTypeController,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    valueSize: .85,
                    text: 'Tipo de cuenta')
              ])),
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
                        onTap: () => submit(),
                        context: context)
                  ]))
        ])));
  }

  submit() {
    if (key.currentState!.validate()) {
      NewCreditCard creditCard = NewCreditCard(
          number: numberCardController.text,
          account: accountController.text,
          issure: issureController.text,
          name: nameController.text,
          brand: brandController.text,
          status: statusController.text,
          balance: balanceController.text,
          type: accountTypeController.text);
      FocusScope.of(context).requestFocus(FocusNode());
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
              title: const Center(child: Text('JSON')),
              content: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      children: [Text(creditCard.toJson().toString())]))));
    }
  }
}
