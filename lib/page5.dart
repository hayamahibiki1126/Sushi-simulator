import 'package:flutter/material.dart';
import 'package:sushi/page2.dart';
import 'package:sushi/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi/viewmodel.dart';

class Page5 extends ConsumerWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(myHomeViewModelProvider);
    return Scaffold(
      body: Center(
        child: Column(
          //Columnの中に入れたものは縦に並べられる．Rowだと横に並べられる
          mainAxisAlignment: MainAxisAlignment.center, //Coloumの中身を真ん中に配置
          children: <Widget>[
            Text('洗った${_viewModel.getNeta()}を切り、ネタができました。\n'
                '寿司を作るためにすることは？'
            ),
            ElevatedButton(
                onPressed: () {
                  _viewModel.inNeta('崩れた寿司');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Fail1()),
                  );
                },
                child: const Text('とりあえず強く握りしめる')),
            ElevatedButton(
                onPressed: () {
                  _viewModel.inNeta('${_viewModel.getNeta()}丼');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Fail1()),
                  );
                },
                child: Text('${_viewModel.getNeta()}をごはんに載せる')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Page6()),
                  );
                },
                child: Text('左手に${_viewModel.getNeta()}を、右手にしゃりをのせて柔らかく握る')),

          ],
        ),
      ),
    );
  }
}

class Page6 extends ConsumerWidget {
  const Page6({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(myHomeViewModelProvider);
    return Scaffold(
      body: Center(
        child: Column(
          //Columnの中に入れたものは縦に並べられる．Rowだと横に並べられる
          mainAxisAlignment: MainAxisAlignment.center, //Coloumの中身を真ん中に配置
          children: <Widget>[
            Text('握られた${_viewModel.getNeta()}の寿司ができました。\n'
                'おめでとう！！！！！！！！！！！'
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