import 'package:bloc/bloc.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/homepage_bloc/homepage_events.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/homepage_bloc/homepage_states.dart';

class HomePageBloc extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBloc() : super(HomePageStates()) {
    on<HomePageDots>(_homePageDots);
  }

  void _homePageDots(HomePageDots event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(event.index));
  }
}
