import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homepage_bloc/homepage_bloc.dart';
import 'homepage_bloc/homepage_states.dart';
import 'homepage_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: BlocBuilder<HomePageBloc, HomePageStates>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              sliderShow(context, state),
            ],
          );
        },
      ),
    );
  }
}
