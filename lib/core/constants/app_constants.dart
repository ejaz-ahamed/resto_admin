import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_constants.g.dart';

final class AppConstants {
  final moneySymbol = '₹';
}

@riverpod
AppConstants appConstants(AppConstantsRef ref) => AppConstants();
