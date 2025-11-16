import 'package:ecommerce_app/app.dart';
import 'package:ecommerce_app/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  setupDependencies();

  final talker = Talker();
  Bloc.observer = TalkerBlocObserver(talker: talker);

  runApp(const EmommerceApp());
}
