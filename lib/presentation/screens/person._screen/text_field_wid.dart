import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/apptextstyles.dart';
import '../../../feature/domain/entity/filter_entity.dart';
import '../listperson/sort_person.dart';
import 'cubit/person_cubit.dart';

class TextFieldWid extends StatefulWidget {
  const TextFieldWid({super.key,required this.search});
  final Function (String name)search;

  @override
  State<TextFieldWid> createState() => _TextFieldWidState();
}

class _TextFieldWidState extends State<TextFieldWid> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Поиск персонажей',
        hintStyle: ApptextStyles.roboto16w400,
        prefixIcon: GestureDetector(
          onTap: () {
            widget.search(controller.text);
          },
          child: const Icon(
            Icons.search,
            color: Color(0xff5B6975),
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SortPerson(),
              ),
            );
          },
          child: Image.asset(
            'assets/icons/sorticon.png',
            scale: 4,
          ),
        ),
        fillColor: const Color(0xff152A3A),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
