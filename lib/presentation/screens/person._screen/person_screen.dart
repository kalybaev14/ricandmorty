
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/apptextstyles.dart';
import 'package:rickandmorty/feature/domain/entity/filter_entity.dart';
import 'package:rickandmorty/presentation/screens/person._screen/cubit/person_cubit.dart';
import 'package:rickandmorty/presentation/screens/person._screen/text_field_wid.dart';
import 'grid_person.dart';
import 'item_person_wid.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animcontoller;
  bool run = false;

  @override
  void initState() {
    animcontoller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    super.initState();
  }

  @override
  void dispose() {
    animcontoller.dispose();
    super.dispose();
  }

  late final filterEntity =
      ValueNotifier<FilterEntity>(FilterEntity(currentpage: 1));
  bool canload = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Column(
          children: [
            TextFieldWid(
              search: (name) {
                filterEntity.value = FilterEntity(searchtext: name);
                BlocProvider.of<PersonCubit>(context)
                    .getPersons(filtermodel: filterEntity.value);
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Всего персонажей: 200',
                  style: ApptextStyles.roboto10w600,
                ),
                IconButton(
                  onPressed: runicon,
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.view_list, progress: animcontoller),
                )
              ],
            ),
          ],
        ),
        toolbarHeight: 120,
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notif) {
          if (notif.metrics.pixels + 150 > notif.metrics.maxScrollExtent &&
              canload) {
            canload = false;
            filterEntity.value = filterEntity.value.copyWith(
              currentpage: filterEntity.value.currentpage ?? 1 + 1,
            );
            context
                .read<PersonCubit>()
                .getPersons(filtermodel: filterEntity.value);
          }
          return true;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocConsumer<PersonCubit, PersonStates>(
            listener: (context, state) async {
              if (state is SuccesPersonStetes) {
                if (!state.isloading) {
                  await Future.delayed(const Duration(milliseconds: 400));
                  canload = true;
                }
              }
            },
            builder: (context, state) {
              if (state is SuccesPersonStetes) {
                return run
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 24,
                          crossAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) =>
                            GridPerson(res: state.results[index]))
                    : ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 24,
                        ),
                        itemCount: state.results.length,
                        itemBuilder: (context, index) => ItemPerson(
                          items: state.results[index],
                        ),
                      );
              }
              if (state is ErrorPersonStetes) {
                return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Image.asset('assets/images/no_result.png',scale: 4,)),
                    const SizedBox(height: 25),
                    const Text('Персонаж с таким именем не найден',style: ApptextStyles.roboto16w400,)
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  void runicon() => setState(() {
        run = !run;
        run ? animcontoller.forward() : animcontoller.reverse();
      });
}
