import 'package:flutter/material.dart';
import 'package:rickandmorty/feature/domain/entity/detail_entity.dart';

import '../../../core/apptextstyles.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({super.key,required this.person});
final DetailResponse person;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 5),
            Text(person.created??'',
              style: ApptextStyles.roboto13w400,
            ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    'Пол',
                    style: ApptextStyles.roboto12w400,
                  ),
                  Text(
                    person.gender??'',
                    style: ApptextStyles.roboto14w400,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    'Расса',
                    style: ApptextStyles.roboto12w400,
                  ),
                  Text(
                    person.species??'',
                    style: ApptextStyles.roboto14w400,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    'Место рождения',
                    style: ApptextStyles.roboto12w400,
                  ),
                  Text(person.location?.name??'',
                    style: ApptextStyles.roboto14w400,
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    'Местоположения',
                    style: ApptextStyles.roboto12w400,
                  ),
                  Text(person.location?.url??'',
                    style: ApptextStyles.roboto14w400,
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
