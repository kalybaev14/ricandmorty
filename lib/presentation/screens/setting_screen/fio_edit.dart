import 'package:flutter/material.dart';
import 'package:rickandmorty/core/apptextstyles.dart';

class FioEdit extends StatefulWidget {
  const FioEdit({Key? key}) : super(key: key);

  @override
  State<FioEdit> createState() => _FioEditState();
}

class _FioEditState extends State<FioEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Изменить ФИО'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 36),
            const Text(
              'Имя',
              style: ApptextStyles.roboto14w400,
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff152A3A),
                hintText: 'Имя',
                hintStyle: TextStyle(color: Color(0xff5B6975)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Фамилия',
              style: ApptextStyles.roboto14w400,
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff152A3A),
                hintText: 'Фамилия',
                hintStyle: TextStyle(color: Color(0xff5B6975)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Отчество',
              style: ApptextStyles.roboto14w400,
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff152A3A),
                hintText: 'Отчество',
                hintStyle: TextStyle(color: Color(0xff5B6975)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Сохранить'),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
