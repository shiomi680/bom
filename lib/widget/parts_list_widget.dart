import '../model/parts_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';
import '../sample_data/sushi.dart';
// import 'package:flutter/src/material/icon_button.dart';
// import 'package:flutter/src/material/icons.dart';
import 'parts_card_widget.dart';

void main() {
  PartsInfo sampleParts = PartsInfo(SUSHI, 2);
  runApp(ProviderScope(child: MaterialApp(home: PartsListWidget())));
}

class PartsListWidget extends ConsumerWidget {
  const PartsListWidget({Key? key}) : super(key: key);

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
                itemCount: 10,
                itemBuilder: (context, index) =>
                    PartsCard(PartsInfo(SUSHI, 1), () => null, () => null))));
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
