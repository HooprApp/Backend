import 'package:get_it/get_it.dart';
import 'package:hoopr/services/challenges.dart';
import 'package:hoopr/services/db.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<DatabaseService>(DatabaseService());
  locator.registerSingleton<ChallengesService>(ChallengesService());
}
