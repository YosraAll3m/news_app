abstract class NewsStates{}
class InitialNewsStates extends NewsStates{}
class BottomBarNewsStates extends NewsStates{}
class NewsHealthLoadingState extends NewsStates{}
class NewsSportLoadingState extends NewsStates{}
class NewsScienceLoadingState extends NewsStates{}
class NewsSearchLoadingState extends NewsStates{}


class ChangeTheme extends NewsStates{}

class GetHealthNewsSuccessState extends NewsStates{}

class GetHealthNewsErrorState extends NewsStates{
  final String error;
  GetHealthNewsErrorState(this.error);
}

class GetSportNewsSuccessState extends NewsStates{}

class GetSportNewsErrorState extends NewsStates{
  final String error;
  GetSportNewsErrorState(this.error);
}

class GetScienceNewsSuccessState extends NewsStates{}

class GetScienceNewsErrorState extends NewsStates{
  final String error;
  GetScienceNewsErrorState(this.error);
}

class GetSearchNewsSuccessState extends NewsStates{}

class GetSearchNewsErrorState extends NewsStates{
  final String error;
  GetSearchNewsErrorState(this.error);
}

