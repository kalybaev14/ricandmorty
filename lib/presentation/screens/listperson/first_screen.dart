import 'package:flutter/material.dart';
import 'package:rickandmorty/feature/domain/entity/filter_entity.dart';
import '../episode_screen/episode_screen.dart';
import '../location_screen/location_screen.dart';
import '../person._screen/person_screen.dart';
import '../setting_screen/setting_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late final filterEntity =
      ValueNotifier<FilterEntity>(FilterEntity(currentpage: 1));

  int selectedindex = 0;
  final List<Widget> widegetoptions = const <Widget>[
    PersonScreen(),
    LocationScreen(),
    EpisodesScreen(),
    SettingScreen(),
  ];
  void onItemTeped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widegetoptions[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Color(0xff5B6975),
        selectedFontSize: 14,
        unselectedFontSize: 12,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined), label: 'Персонажи'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined), label: 'Локации'),
          BottomNavigationBarItem(
              icon: Icon(Icons.live_tv_rounded), label: 'Эпизоды'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Настройки'),
        ],
        currentIndex: selectedindex,
        onTap: onItemTeped,
      ),
    );
  }
}
