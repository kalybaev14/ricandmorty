import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/apptextstyles.dart';
import 'package:rickandmorty/feature/data/network/dio_settings.dart';
import 'package:rickandmorty/feature/data/repo/rick_repo.dart';
import 'package:rickandmorty/feature/domain/entity/filter_entity.dart';
import 'package:rickandmorty/presentation/screens/listperson/first_screen.dart';
import 'package:rickandmorty/presentation/screens/person._screen/cubit/person_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(brightness: Brightness.light,hintColor: Colors.white54,
          textTheme: TextTheme(
            bodyText2: ApptextStyles.roboto16w500.copyWith(color: Colors.black),
          ),
          iconTheme:const IconThemeData(color: Colors.black),
          primaryColor: Colors.blue,
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xffF2F2F2)),
          scaffoldBackgroundColor: const Color(0xffF2F2F2),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Color(0xff22A2BD),
              backgroundColor: Color(0xffFFFFFF)),
        ),
        darkTheme: ThemeData.dark().copyWith(brightness: Brightness.dark,
          textTheme: TextTheme(
            bodyText2:
                ApptextStyles.roboto16w500.copyWith(color:const Color(0xffFFFFFF)),
          ),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xff0B1E2D)),
          scaffoldBackgroundColor: const Color(0xff0B1E2D),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.green,
              backgroundColor: Color(0xff152A3A)),
        ),
        themeMode: ThemeMode.dark,
        home: const FirstScreen(),
      ),
    );
  }
}

class InitWidget extends StatelessWidget {
  const InitWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Diosettings(),
        ),
        RepositoryProvider(
          create: (context) => RickRepoImpl(
              dio: RepositoryProvider.of<Diosettings>(context).dio),
        ),
      ],
      child: BlocProvider(
        create: (context) => PersonCubit(
          repo: RepositoryProvider.of<RickRepoImpl>(context),
        )..getPersons(filtermodel: FilterEntity()),
        child: child,
      ),
    );
  }
}
