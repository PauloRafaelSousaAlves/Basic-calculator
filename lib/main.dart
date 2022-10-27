
import 'package:calculator/app/calculation_history_service.dart';
import 'package:calculator/presenter/calculation/bloc/calculation_bloc.dart';
import 'package:calculator/presenter/calculation/ui/calculation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  runApp(Calculator(sharedPreferences: sharedPreferences));
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key, required this.sharedPreferences})
      : super(key: key);

  final SharedPreferences sharedPreferences;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic calculator',
      home: Scaffold(
        body: BlocProvider(
          create: (context) {
            return CalculationBloc(
              calculationHistoryService: CalculationHistoryService(
                sharedPreferences: widget.sharedPreferences,
              ),
            );
          },
          child: const Calculation(),
        ),
      ),
    );
  }
}