import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi/repository.dart';

// ViewModelの格納先はChangeNotifierProviderとなる
final myHomeViewModelProvider = ChangeNotifierProvider((ref) => MyHomeViewModel(repository: ref.read(myHomeRepositoryProvider)));

// ChangeNotifierを継承することで、呼び出し元に変更を通知することが可能
class MyHomeViewModel extends ChangeNotifier {

  String _neta = 'error.';

  MyHomeRepository? repository;

  MyHomeViewModel({this.repository});

  String getNeta() {
    return _neta;
  }

  void inNeta(String ne) {
    this.repository?.inNeta(ne).then((resultModel) {
      _neta = resultModel.neta;
      // 以下を実行することで、呼び出し元に変更が通知され、setStateしたときと同様に画面がリビルドされる
      notifyListeners();
    });
  }
}