import 'package:awesome_snack_bar/widgets/states_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCubit extends Cubit<States>{
  MyCubit() : super(Loading()){
    Future.delayed(Duration(seconds: 2), ()=> emit(Success()));
  }

  static MyCubit of(context)=> BlocProvider.of(context);

  int counter = 0;

  void doSomething(){
    counter++;
    emit(Rebuild());
  }

}




abstract class States implements BaseStates {}

class Loading extends States implements BaseLoadingState {}

class Success extends States implements BaseSuccessState {}

class Empty extends States implements BaseEmptyState {}

class Error extends States implements BaseErrorState {}

class Init extends States implements BaseInitState {}

class Rebuild extends States {}