import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'error_view.dart';
import 'no_content.dart';

class StatesBuilder<B extends BlocBase<BaseStates>, BaseStates>
    extends StatelessWidget {
  StatesBuilder({
    this.onInit,
    this.onSuccess,
    this.cubit,
    this.onLoading,
    this.onEmpty,
    this.onError,
    this.builder, 
    this.buildWhen,
  });
  // : assert(onSuccess == null || onSuccess is Function || onSuccess is Widget, 'onSuccess Must be a Function returns Widget or Widget');
  final Widget? onInit;
  final Widget Function()? onSuccess;
  final Widget? onLoading;
  final Widget? onError;
  final Widget? onEmpty;
  final B? Function(BuildContext context)? cubit;
  final Widget Function(BuildContext, BaseStates)? builder;
  final bool Function(BaseStates,BaseStates)? buildWhen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, BaseStates>(
      bloc: cubit == null ? null : cubit!(context),
      buildWhen: buildWhen != null ? buildWhen! : (previous, current) => builder != null || current is _States,
      builder:  builder == null ? (context, state) {
        if (state is BaseLoadingState)
          return onLoading ?? Center(child: CircularProgressIndicator(),);
        else if (state is BaseErrorState)
          return onError ?? ErrorView();
        else if (state is BaseSuccessState)
          return onSuccess == null ? SizedBox() : onSuccess!();
        else if (state is BaseEmptyState)
          return onEmpty ?? NoContent();
        return onInit ?? Center(child: Text('Init State'));
        /*
        if(state is BaseLoadingState)
          return onLoading ?? SizedBox();
        else if(state is BaseErrorState)
          return onError ?? SizedBox();
        else if(state is BaseSuccessState)
          return onSuccess ?? SizedBox();
        else if(state is BaseEmptyState)
          return onEmpty ?? SizedBox();
        return onInit ?? SizedBox();
         */
      } : builder!,
    );
  }
}

abstract class BaseStates {}

abstract class _States {}

class BaseInitState extends BaseStates implements _States {}

class BaseLoadingState extends BaseStates implements _States {}

class BaseSuccessState extends BaseStates implements _States {}

class BaseErrorState extends BaseStates implements _States {}

class BaseEmptyState extends BaseStates implements _States {}
