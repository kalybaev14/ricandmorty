import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/screens/setting_screen/setting_widget/tittle_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {}),
        title: const Text('Настройки'),
        elevation: 0,
      ),
      body:const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16),
        child: TitleWidget(),
      ),
    );
  }
}
