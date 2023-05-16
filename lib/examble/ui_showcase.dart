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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InfoDialog(title: 'Info Dialog', content: 'Test Content', type: InfoDialogType.info),

          ],
        ),
      ),
    );

  }
}
