import 'package:flutter/material.dart';
import 'package:sushi/main.dart';
import 'package:sushi/page2.dart';
import 'package:sushi/page5.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi/viewmodel.dart';

class Page4 extends ConsumerWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(myHomeViewModelProvider);
    return Scaffold(
      body: Center(
        child: Column(
          //Columnの中に入れたものは縦に並べられる．Rowだと横に並べられる
          mainAxisAlignment: MainAxisAlignment.center, //Coloumの中身を真ん中に配置
          children: <Widget>[
            Text('あなたは酢を用意し、酢飯を作りました。\n'
                'ここに${_viewModel.getNeta()}があります。\n'
                'ネタ作りのためにすることは？'
            ),
            ElevatedButton(
                onPressed: () {
                  _viewModel.inNeta('汚れた${_viewModel.getNeta()}でネタ');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Fail2()),
                  );
                },
                child: Text('${_viewModel.getNeta()}を切る')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Page5()),
                  );
                },
                child: Text('${_viewModel.getNeta()}を洗う')),
            ElevatedButton(
                onPressed: () {
                  _viewModel.inNeta('煮${_viewModel.getNeta()}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Fail1()),
                  );
                },
                child: Text('${_viewModel.getNeta()}を煮る')),
          ],
        ),
      ),
    );
  }
}

class Fail2 extends StatelessWidget {
  const Fail2({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //Columnの中に入れたものは縦に並べられる．Rowだと横に並べられる
          mainAxisAlignment: MainAxisAlignment.center, //Coloumの中身を真ん中に配置
          children: <Widget>[
            const Text('あなたはネタが汚れたまま切ってしまいました。\n'
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