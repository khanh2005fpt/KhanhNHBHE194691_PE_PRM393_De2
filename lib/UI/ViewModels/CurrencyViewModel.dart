import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/SettingRepository.dart';

part 'CurrencyViewModel.g.dart';

@riverpod
class CurrencyNotifier extends _$CurrencyNotifier {
  late SettingRepository _repository;

  @override
  String build() {
    _repository = ref.watch(settingRepositoryProvider);
    _getCurrency();
    return 'VND';
  }

  Future<void> _getCurrency() async {
    state = await _repository.getCurrency();
  }

  Future<void> setCurrency(String newCurrency) async {
    state = newCurrency;
    await _repository.setCurrency(newCurrency);
  }
}

final currencyViewModelProvider = currencyProvider;
