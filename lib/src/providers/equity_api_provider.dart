import 'package:flutter/foundation.dart';
import 'package:equity/src/services/equity_api_service.dart';

class EquityApiProvider extends ChangeNotifier {
  final EquityApiService _service = EquityApiService();
}
