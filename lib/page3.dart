import 'package:flutter/material.dart';
import 'package:sushi/page2.dart';
import 'package:sushi/page4.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi/viewmodel.dart';

class Page3 extends ConsumerWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(myHomeViewModelProvider);
    return Scaffold(
      body: Center(
        child: Column(
          //Columnの中に入れたものは縦に並べられる．Rowだと横に並べられる
          mainAxisAlignment: MainAxisAlignment.center, //Coloumの中身を真ん中に配置
          children: <Widget>[
            const Text('あなたは酢飯を作ります。\n'
                'あなたはどうしますか？'
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Page4()),
                  );
                },
                child: const Text('砂糖と塩と米酢で合わせ酢を作ります')),
            ElevatedButton(
                onPressed: () {
                  _viewModel.inNeta('ぽん酢');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Fail1()),
                  );
                },
                child: const Text('みりんと醤油と昆布を用意します')),
            ElevatedButton(
                onPressed: () {
                  _viewModel.inNeta('バルサミコ酢');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Fail1()),
                  );
                },
                child: const Text('ぶどうの果汁を用意します')),
          ],
        ),
      ),
    );
  }
}
