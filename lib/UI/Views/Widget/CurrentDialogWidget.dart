import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../ViewModels/CurrencyViewModel.dart';

class CurrencyDialogWidget extends ConsumerStatefulWidget {
  const CurrencyDialogWidget({super.key});

  @override
  ConsumerState<CurrencyDialogWidget> createState() => _CurrencyDialogWidgetState();
}

class _CurrencyDialogWidgetState extends ConsumerState<CurrencyDialogWidget> {
  late String _tempSelected;

  @override
  void initState() {
    super.initState();
    _tempSelected = ref.read(currencyProvider);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('Đơn vị tiền tệ', style: TextStyle(fontWeight: FontWeight.bold)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<String>(
            title: const Text('VND (Việt Nam Đồng)'),
            value: 'VND',
            groupValue: _tempSelected,
            onChanged: (val) {
              if (val != null) setState(() => _tempSelected = val);
            },
          ),
          RadioListTile<String>(
            title: const Text('USD (Đô la Mỹ)'),
            value: 'USD',
            groupValue: _tempSelected,
            onChanged: (val) {
              if (val != null) setState(() => _tempSelected = val);
            },
          ),
        ],
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text('Hủy', style: TextStyle(color: Colors.black87)),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(currencyProvider.notifier).setCurrency(_tempSelected);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text('Lưu'),
        ),
      ],
    );
  }
}
