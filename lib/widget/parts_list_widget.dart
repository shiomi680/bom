import '../model/parts_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';
import '../sample_data/sushi.dart';
import 'parts_card_widget.dart';

void main() {
  PartsInfo sampleParts = PartsInfo(SUSHI, 1);
  PartsInfo sampleParts2 = PartsInfo(MAGURO, 2);
  PartsInfo sampleParts3 = PartsInfo(SHARI, 3);
  runApp(ProviderScope(
      child: MaterialApp(
          home: PartsListWidget(
    partsInfoList: [sampleParts, sampleParts2, sampleParts3],
  ))));
}

class PartsListWidget extends ConsumerWidget {
  PartsListWidget({this.partsInfoList = const [], Key? key}) : super(key: key);

  List<PartsInfo> partsInfoList;

  static PartsListWidget builder() {
    return PartsListWidget();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final List<PartsInfo>
    // final PartsInfo partsInfo = ref.watch(partsInfoProvider);
    // final ThemeData themeData = Theme.of(context);
    // double padding = 25;
    // final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Container(
        child: Expanded(
            child: ListView.builder(
                controller: ScrollController(),
                itemCount: partsInfoList.length,
                itemBuilder: (context, index) =>
                    PartsCard(partsInfoList[index], () => null, () => null))));
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
//           Container(
//             height: 400,
//             child: PartsListWidget(),
//             width: 600,
//           ),
//           ElevatedButton(
//               onPressed: () => ref
//                   .read(partsInfoProvider.notifier)
//                   .setPartsInfo(PartsInfo(SUSHI, 1)),
//               child: const Text("testbutton")),
//         ])));
//   }
// }
