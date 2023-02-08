import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/apptextstyles.dart';
import 'package:rickandmorty/presentation/screens/person._screen/cubit/person_cubit.dart';

class SortPerson extends StatefulWidget {
  const SortPerson({super.key});

  @override
  State<SortPerson> createState() => _SortPersonState();
}

class _SortPersonState extends State<SortPerson> {
  bool ischecked = false;
  bool ischecked2 = false;
  bool ischecked3 = false;
  bool ischecked4 = false;
  bool ischecked5 = false;
  bool ischecked6 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Фильтры'),
        backgroundColor: const Color(0xff152A3A),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Сортировать',
              style: ApptextStyles.roboto10w500,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'По алфавиту',
                    style: ApptextStyles.roboto16w400
                        .copyWith(color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Image.asset(
                    'assets/icons/filtr.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(width: 12),
                Image.asset(
                  'assets/icons/filtr2.png',
                  scale: 4,
                ),
              ],
            ),
            const SizedBox(height: 36),
            const Divider(
              color: Color(0xff152A3A),
              thickness: 2,
            ),
            const SizedBox(height: 36),
            const Text(
              'Статус',
              style: ApptextStyles.roboto10w500,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Checkbox(
                  value: ischecked,
                  onChanged: (bool? value) {
                    setState(() {
                      ischecked = value!;
                    });
                  },
                ),
                const SizedBox(width: 16),
                Text(
                  'Живой',
                  style:
                      ApptextStyles.roboto16w400.copyWith(color: Colors.white),
                ),
              ],
            ),
             Row(
              children: [
                Checkbox(
                  value: ischecked2,
                  onChanged: (bool? value) {
                    setState(() {
                      ischecked2 = value!;
                    });
                  },
                ),
                const SizedBox(width: 16),
                Text(
                  'Мертвый',
                  style:
                      ApptextStyles.roboto16w400.copyWith(color: Colors.white),
                ),
              ],
            ),
             Row(
              children: [
                Checkbox(
                  value: ischecked3,
                  onChanged: (bool? value) {
                    setState(() {
                      ischecked3 = value!;
                    });
                  },
                ),
                const SizedBox(width: 16),
                Text(
                  'Неизвестно',
                  style:
                      ApptextStyles.roboto16w400.copyWith(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 36),
            const Divider(
              color: Color(0xff152A3A),
              thickness: 2,
            ),
             const SizedBox(height: 36),
            const Text(
              'Пол',
              style: ApptextStyles.roboto10w500,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Checkbox(
                  value: ischecked4,
                  onChanged: (bool? value) {
                    setState(() {
                      ischecked4 = value!;
                    });
                  },
                ),
                const SizedBox(width: 16),
                Text(
                  'Мужской',
                  style:
                      ApptextStyles.roboto16w400.copyWith(color: Colors.white),
                ),
              ],
            ),
             Row(
              children: [
                Checkbox(
                  value: ischecked5,
                  onChanged: (bool? value) {
                    setState(() {
                      ischecked5 = value!;
                    });
                  },
                ),
                const SizedBox(width: 16),
                Text(
                  'Женский',
                  style:
                      ApptextStyles.roboto16w400.copyWith(color: Colors.white),
                ),
              ],
            ),
             Row(
              children: [
                Checkbox(
                  value: ischecked6,
                  onChanged: (bool? value) {
                    setState(() {
                      ischecked6 = value!;
                    });
                  },
                ),
                const SizedBox(width: 16),
                Text(
                  'Бесполый',
                  style:
                      ApptextStyles.roboto16w400.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
