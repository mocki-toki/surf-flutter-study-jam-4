sealed class HomeState {
  const HomeState();
}

final class LoadingHomeState extends HomeState {
  const LoadingHomeState();
}

final class LoadedHomeState extends HomeState {
  final String? content;

  const LoadedHomeState([this.content]);
}

final class ErrorHomeState extends HomeState {
  const ErrorHomeState();
}
