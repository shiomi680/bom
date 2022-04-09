import '../model/material_info.dart';
import '../model/parts_info.dart';
import '../widget/parts_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widget/parts_list_widget.dart';
import '../providers.dart';
import '../sample_data/sushi.dart';
import '../widget/file_list_widget.dart';
import '../widget/main_info_widget.dart';

void main() {
  PartsInfo sampleParts = PartsInfo(SUSHI, 2);
  runApp(ProviderScope(child: MaterialApp(home: MainPage())));
}

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topInfo = ref.watch(topInfoProvider);
    return MaterialApp(
        title: 'Flutter test',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Scaffold(
            body: Column(children: [
          Container(child: MainInfoWidget(topInfo)),
          Container(
            child: PartsCard.builder(ref.watch(sushiPartsProvider),
                ref.watch(sushiPartsProvider.notifier)),
          ),
          Container(height: 500, child: const DataTableView())
        ])));
  }
}

class DataTableView extends ConsumerWidget {
  const DataTableView({Key? key}) : super(key: key);

  Widget build_lineup(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
          // height: 300,
          child: Row(children: [
        Container(
          child: PartsListWidget(),
          width: constraints.maxWidth - 400,
          // height: 300,
        ),
        Container(
          child: FileListWidget(["abc", "test"]),
          width: 400,
          // height: 300,
        )
      ]));
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return build_lineup(context, ref);
  }
}

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends ConsumerWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return MaterialApp(
//         title: 'Flutter test',
//         theme: ThemeData(
//           primarySwatch: Colors.deepPurple,
//         ),
//         home: Scaffold(
//             body: Column(children: [
//           const DataTableView(),
//           ElevatedButton(
//               onPressed: () => ref
//                   .read(partsInfoProvider.notifier)
//                   .setPartsInfo(PartsInfo(SUSHI, 1)),
//               child: const Text("testbutton")),
//         ])));
//   }
// }
