import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi/model.dart';

final myHomeRepositoryProvider = Provider((ref) => MyHomeRepositoryImpl(model: ref.read(resultModelProvider)));

abstract class MyHomeRepository {
  Future<ResultModel> inNeta(String ne);
}

class MyHomeRepositoryImpl implements MyHomeRepository {
  MyHomeRepositoryImpl({required ResultModel model}): _model = model;

  final ResultModel _model;

  @override
  Future<ResultModel> inNeta(String ne) {
    _model.neta = ne;
    return Future.value(_model);
  }
}