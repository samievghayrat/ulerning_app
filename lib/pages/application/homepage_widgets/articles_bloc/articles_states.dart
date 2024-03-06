class ArticlesStates {
  late int articleIndex;

  ArticlesStates({this.articleIndex = 0});

  ArticlesStates copyWith(int? index) {
    return ArticlesStates(articleIndex: index ?? this.articleIndex);
  }
}
