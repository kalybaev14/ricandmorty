import 'package:flutter/material.dart';
import 'package:rickandmorty/core/apptextstyles.dart';

import 'fio_edit.dart';

class EditWidget extends StatelessWidget {
  const EditWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактировать профиль'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/avatarr.png',
                  scale: 3,
                  height: 150,
                  width: 150,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text('Изменить фото'),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Профиль',
              style: ApptextStyles.roboto10w500,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Изменить ФИО',
                        style: ApptextStyles.roboto16w400
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Oleg Belotserkovsky',
                        style: ApptextStyles.roboto14w400
                            .copyWith(color: const Color(0xff6E798C)),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FioEdit(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.navigate_next_outlined),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Логин',
                        style: ApptextStyles.roboto16w400
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Rick',
                        style: ApptextStyles.roboto14w400
                            .copyWith(color: const Color(0xff6E798C)),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next_outlined),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
