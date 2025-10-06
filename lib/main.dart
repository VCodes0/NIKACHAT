import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikachat/cubit/search_cubit.dart';

import 'screens/home/home_screen.dart';

void main() {
  runApp(const Nikachat());
}

class Nikachat extends StatelessWidget {
  const Nikachat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: CupertinoColors.white,
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            shadowColor: CupertinoColors.black,
            centerTitle: true,
            backgroundColor: CupertinoColors.white,
            foregroundColor: CupertinoColors.black,
            elevation: .7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.directional(
                bottomStart: Radius.circular(30),
                bottomEnd: Radius.circular(30),
              ),
            ),
            surfaceTintColor: CupertinoColors.white,
          ),
        ),
        title: 'Nikachat',
        home: HomePage(),
      ),
    );
  }
}
