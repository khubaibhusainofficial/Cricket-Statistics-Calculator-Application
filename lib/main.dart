import 'package:cricket_stats/Average/avg_bloc.dart';
import 'package:cricket_stats/Batsman/Average_Calculation/average_batsman_bloc.dart';
import 'package:cricket_stats/Batsman/Batsman_SR/bat_sr_bloc.dart';
import 'package:cricket_stats/Economy/economy_bloc.dart';
import 'package:cricket_stats/Utility/shell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'Hive_DB/Models/model_stats.dart';
import 'Hive_DB/enum/myEnum.dart';
import 'SR/sr_bloc.dart';
import 'SR/sr_state.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ModelStatsAdapter());
  Hive.registerAdapter(StatTypeAdapter());
  await Hive.openBox<ModelStats>("Save Results");

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SrBloc()),
        BlocProvider(create: (_) => EconomyBloc()),
        BlocProvider(create: (_) => AvgBloc()),
        BlocProvider(create: (_) => AverageBatsmanBloc()),
        BlocProvider(create: (_) => BatSrBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SrBloc, SrState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF1B5E20),
              brightness: Brightness.light,
            ),
            scaffoldBackgroundColor: const Color(0xFFF5F7F5),
          ),
          home: AppShell(),
        );
      },
    );
  }
}
