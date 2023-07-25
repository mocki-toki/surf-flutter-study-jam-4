import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/domain/services/reading_service.dart';
import 'package:surf_practice_magic_ball/infrastructure/services/reading_service_impl.dart';
import 'package:surf_practice_magic_ball/presentation/bloc/home/home_bloc.dart';
import 'package:surf_practice_magic_ball/presentation/pages/home_page.dart';
import 'package:surf_practice_magic_ball/presentation/services/slow_animation_provider.dart';
import 'package:surf_practice_magic_ball/presentation/services/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final readingService = ReadingServiceImpl(Dio());

  runApp(MyApp(readingService));
}

class MyApp extends StatelessWidget {
  const MyApp(this.readingService, {super.key});

  final ReadingService readingService;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(readingService),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(
            seedColor: Colors.lightGreen,
            themeMode: false,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => SlowAnimationProvider(slow: false),
        ),
      ],
      child: Consumer<ThemeProvider>(
        child: HomePage(),
        builder: (c, themeProvider, child) {
          final theme = themeProvider.darkMode
              ? ThemeData.dark(
                  useMaterial3: true,
                ).copyWith(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: themeProvider.seedColor,
                    brightness: Brightness.dark,
                  ),
                )
              : ThemeData.light(
                  useMaterial3: true,
                ).copyWith(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: themeProvider.seedColor),
                );

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: child,
          );
        },
      ),
    );
  }
}
