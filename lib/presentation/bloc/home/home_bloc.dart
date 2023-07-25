import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/domain/services/reading_service.dart';
import 'package:surf_practice_magic_ball/presentation/bloc/home/home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc(this._readingService) : super(const LoadedHomeState());

  final ReadingService _readingService;

  Future<void> getReading() async {
    emit(const LoadingHomeState());

    final content = await _readingService.getReading();
    final state = content.fold(
      (l) => const ErrorHomeState(),
      (r) => LoadedHomeState(r.reading),
    );

    await Future.delayed(const Duration(seconds: 2));

    emit(state);
  }
}
