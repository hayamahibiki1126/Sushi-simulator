import 'package:flutter/material.dart';
import 'package:sushi/main.dart';
import 'package:sushi/page3.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi/viewmodel.dart';

class Page2 extends ConsumerWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(myHomeViewModelProvider);
    return Scaffold(
      body: Center(
        child: Column(
          //Columnの中に入れたものは縦に並べられる．Rowだと横に並べられる
          mainAxisAlignment: MainAxisAlignment.center, //Coloumの中身を真ん中に配置
          children: <Widget>[
            Text('あなたは${_viewModel.getNeta()}で寿司を作ります。\n'
                'あなたはどうしますか？'
            ),
            ElevatedButton(
                onPressed: () {
                  _viewModel.inNeta('酢豚');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Fail1()),
                  );
                },
                child: const Text('酢豚を作る')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Page3()),
                  );
                },
                child: const Text('酢飯を作る')),
            ElevatedButton(
                onPressed: () {
                  _viewModel.inNeta('酸飯');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Fail1()),
                  );
                },
                child: const Text('酸飯を作る')),
          ],
        ),
      ),
    );
  }
}


class Fail1 extends ConsumerWidget {
  const Fail1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(myHomeViewModelProvider);
    return Scaffold(
      body: Center(
        child: Column(
          //Columnの中に入れたものは縦に並べられる．Rowだと横に並べられる
          mainAxisAlignment: MainAxisAlignment.center, //Coloumの中身を真ん中に配置
          children: <Widget>[
            Text('あなたは${_viewModel.getNeta()}を作りました。\n'
                'あなたはまちがっています'
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                child: const Text('戻る')),
          ],
        ),
      ),
    );
  }
}