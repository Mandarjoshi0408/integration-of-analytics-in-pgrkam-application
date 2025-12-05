import '/src/logic/services/api_services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_page_model.freezed.dart';

final mainPageProvider =
    StateNotifierProvider.autoDispose<MainPageModel, MainPageState>(
  (ref) => MainPageModel(
    apiService: ref.read(apiServiceProvider),
  ),
);

class MainPageModel extends StateNotifier<MainPageState> {
  final ApiService apiService;

  MainPageModel({
    required this.apiService,
  }) : super(const MainPageState());
}

@freezed
class MainPageState with _$MainPageState {
  const factory MainPageState({
    @Default(0) int userBalance,
  }) = _MainPageState;
}
