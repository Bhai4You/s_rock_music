import 'package:flutter/material.dart';

import '../../../model/service_model.dart';
import '../../../utils/service/firebase_service.dart';

class HomeProvider extends ChangeNotifier {
  final ServiceRepository _repository = ServiceRepository();
  List<ServiceModel> _services = [];
  bool _isLoading = false;
  String? _error;

  List<ServiceModel> get services => _services;
  bool get isLoading => _isLoading;
  String? get error => _error;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchServices() async {
    setLoading(true);

    try {
      _services = await _repository.fetchServices();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      setLoading(false);
    }
  }
}
