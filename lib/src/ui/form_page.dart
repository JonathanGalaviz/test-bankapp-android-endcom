import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/button_widget.dart';
import 'package:test_bankapp_android_endcom/src/ui/widgets/input_widget.dart';

class FormaPage extends StatefulWidget {
  const FormaPage({Key? key}) : super(key: key);

  @override
  State<FormaPage> createState() => _FormaPageState();
}

class _FormaPageState extends State<FormaPage> {
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
