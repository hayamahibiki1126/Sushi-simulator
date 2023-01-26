import 'package:flutter/material.dart';
import 'package:sushi/page2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi/viewmodel.dart';

class Page1 extends ConsumerWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(myHomeViewModelProvider);
    return Scaffold(
      body: Center(
        child: Column(
          //Columnの中に入れたものは縦に並べられる．Rowだと横に並べられる
          mainAxisAlignment: MainAxisAlignment.center, //Coloumの中身を真ん中に配置
          children: <Widget>[
            const Text(
              'あなたは寿司を作ることになりました。\n'
                  'どのネタを取るか？',
            ),
            ElevatedButton(
                onPressed:  () {
                  _viewModel.inNeta('マグロ');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Page2()),
                  );
                },
                child: const Text('マグロ')),
            ElevatedButton(
                onPressed:  () {
                  _viewModel.inNeta('サーモン');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Page2()),
                  );
                },
                child: const Text('サーモン')),
            ElevatedButton(
                onPressed:  () {
                  _viewModel.inNeta('たまご');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Page2()),
                  );
                },
                child: const Text('たまご')),
          ],

        ),
      ),
    );
  }
}