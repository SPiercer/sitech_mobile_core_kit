import 'package:flutter/material.dart';
import 'package:sitech_mobile_core_kit/sitech_mobile_core_kit.dart';

class UIShowcase extends StatelessWidget {
  const UIShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Kit Showcase'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20),
          const RBackButton(),
          const SizedBox(height: 20),
          const Divider(height: 10, color: Colors.grey),
          const SizedBox(height: 20),
          const InfoDialog(
              title: 'Info Dialog',
              content: 'Test Content',
              type: InfoDialogType.success),
          const SizedBox(height: 20),
          const InfoDialog(
              title: 'Error Dialog',
              content: 'Test Content',
              type: InfoDialogType.error),
          const SizedBox(height: 20),
          const InfoDialog(
              title: 'Info success',
              content: 'Test Content',
              type: InfoDialogType.success),
          const SizedBox(height: 20),
          const Divider(height: 10,  color: Colors.grey),
          const SizedBox(height: 20),
          const InputButton(
            filled: true,
            child: Text('Input Button Filled'),
          ),
          const SizedBox(height: 20),
          const InputButton(
            filled: false,
            child: Text('Input Button'),
          ),
          const SizedBox(height: 20),
          const  Divider(height: 10, color: Colors.grey),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InputField(
              label: 'Input Field',
              hint: 'Input Field hint',
              controller: TextEditingController(),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InputField(
              label: 'Input Field',
              hint: 'Obscure Text',
              obscureText: true,
              controller: TextEditingController(),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(height: 10, color: Colors.grey),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InputPhoneField(
              label: 'label',
              hint: 'hint',
              controller: TextEditingController(),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
