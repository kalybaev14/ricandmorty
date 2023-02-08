import 'package:flutter/material.dart';

import '../../../../core/apptextstyles.dart';
import '../edit_screen.dart';

class TitleWidget extends StatefulWidget {
  const TitleWidget({super.key});

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 33),
        Row(
          children: [
            ClipRRect(
              child: Image.asset(
                'assets/images/avatarr.png',
                scale: 4,
                height: 80,
                width: 80,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Айнабек Калыбаев',
                  style:
                      ApptextStyles.roboto16w400.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Rick',
                  style: ApptextStyles.roboto14w400
                      .copyWith(color: const Color(0xff6E798C)),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 29),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditWidget(),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: const Color(0xff22A2BD)),
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                'Рeдактировать',
                style: ApptextStyles.roboto16w400.copyWith(
                  color: const Color(0xff22A2BD),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        const Divider(
          thickness: 2,
          color: Color(0xff152A3A),
        ),
        const SizedBox(height: 36),
        const Text(
          'Внешний вид',
          style: ApptextStyles.roboto10w500,
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Image.asset(
              'assets/icons/theme.png',
              scale: 4,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Темная тема',
                    style: ApptextStyles.roboto16w400
                        .copyWith(color: Colors.white),
                  ),
                  Text('Включена',
                      style: ApptextStyles.roboto14w400
                          .copyWith(color: Color(0xff6E798C))),
                ],
              ),
            ),
            IconButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: const Color(0xff152A3A),
                  titleTextStyle: ApptextStyles.roboto20w500,
                  title: const Text('Темная тема'),
                  actionsOverflowAlignment: OverflowBarAlignment.start,
                  actions: <Widget>[
                    Row(
                      children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: show,
                          onChanged: (bool? value) {
                            setState(() {
                              show = value!;
                            });
                          },
                        ),
                        Text(
                          'Включить',
                          style: ApptextStyles.roboto16w400
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: show,
                          onChanged: (bool? value) {
                            setState(() {
                              show = value!;
                            });
                          },
                        ),
                        Text(
                          'Выключить',
                          style: ApptextStyles.roboto16w400
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: show,
                          onChanged: (bool? value) {
                            setState(() {
                              show = value!;
                            });
                          },
                        ),
                        Text(
                          'Следовать настройкам системы',
                          style: ApptextStyles.roboto16w400
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: show,
                          onChanged: (bool? value) {
                            setState(() {
                              show = value!;
                            });
                          },
                        ),
                        Text(
                          'В режиме энергосбережения',
                          style: ApptextStyles.roboto16w400
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle:const TextStyle(color: Colors.white,fontSize: 16),
                          ),
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Отмена'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              icon: const Icon(Icons.navigate_next_outlined),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Divider(
          thickness: 2,
          color: Color(0xff152A3A),
        ),
        const SizedBox(height: 36),
        const Text(
          'О приложений',
          style: ApptextStyles.roboto10w500,
        ),
        const SizedBox(height: 24),
        const Text(
          'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
          style: ApptextStyles.roboto13w400,
        ),
        const SizedBox(height: 36),
        const Divider(
          thickness: 2,
          color: Color(0xff152A3A),
        ),
        const SizedBox(height: 36),
        const Text(
          'Версия приложения',
          style: ApptextStyles.roboto10w500,
        ),
        const SizedBox(height: 24),
        const Text(
          'Rick & Morty v1.0.0',
          style: ApptextStyles.roboto13w400,
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}
