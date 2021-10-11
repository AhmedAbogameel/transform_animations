import 'package:awesome_snack_bar/widgets/states_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class View extends StatelessWidget {
  View({Key? key}) : super(key: key);

  final cubit = MyCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=> cubit,
        child: Scaffold(
          body: Center(
            child: StatesBuilder(
              cubit: (context) => cubit,
              onSuccess: () => Column(
                children: [
                  ElevatedButton(onPressed: cubit.doSomething, child: Text(cubit.counter.toString())),
                  ElevatedButton(onPressed: ()=> cubit.emit(Success()), child: Text('Change to else')),
                ],
              ),
            ),
          ),
        )
    );
  }
}
