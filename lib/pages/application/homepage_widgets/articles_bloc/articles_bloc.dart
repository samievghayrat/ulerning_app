import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/articles_bloc/articles_events.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/articles_bloc/articles_states.dart';

class ArticleBloc extends Bloc<ArticleEvents, ArticlesStates> {
  ArticleBloc() : super(ArticlesStates()) {
    on<ArticlesDotEvents>(_articleDots);
  }

  void _articleDots(ArticlesDotEvents event, Emitter<ArticlesStates> emit) {
    print("The article index is: ${event.index.toString()}");
    emit(state.copyWith(event.index));
  }
}
