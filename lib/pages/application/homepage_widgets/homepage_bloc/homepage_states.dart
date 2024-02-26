class HomePageStates {
  final int index;

  HomePageStates({this.index = 0});

  HomePageStates copyWith(int? newIndex) {
    return HomePageStates(index: newIndex ?? this.index);
  }
}
