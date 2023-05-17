import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // log('${bloc.runtimeType} current:${transition.currentState} event:${transition.event} next:${transition.nextState}');
  }
}
