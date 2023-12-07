import 'package:flutter/material.dart';
import 'package:travl/components/hero.dart';
import 'package:travl/screens/landing.dart';
import 'package:travl/screens/register.dart';
import 'package:travl/screens/terms.dart';
import 'package:travl/components/title.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(Register());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = TitleSec(
      title: 'Oeschinen Lake Campground',
      description: 'Kandersteg, Switzerland',
      descColor: Colors.grey[500],
      iconColor: Colors.red[400],
    );
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            HeroSec(imagePath: 'images/man-bird.jpeg', height: 250, width: 600),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:travl/components/hero.dart';

// void main() {
//   runApp(_homeScreen()
//       // HeroSec(imagePath: 'images/man-bird.jpeg', height: 20, width: 20),
//       // MaterialApp(
//       //     title: 'Travl App',
//       //     home: Scaffold(
//       //       body: Column(
//       //         children: [
//       //           titleSection,
//       //         ],
//       //       ),
//       //     )),
//       );
// }

// Widget _homeScreen() {
//   return MaterialApp(
//     title: 'Travl App',
//     home: Scaffold(
//       body: Column(
//         children: [
//           HeroSec(imagePath: 'images/man-bird.jpeg', height: 250, width: 600)
//         ],
//       ),
//     ),
//   );
// }

// Widget titleSection = Container(
//   padding: const EdgeInsets.all(32),
//   child: Row(
//     children: [
//       Expanded(
//         /*1*/
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /*2*/
//             Container(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: const Text(
//                 'Oeschinen Lake Campground',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Text(
//               'Kandersteg, Switzerland',
//               style: TextStyle(
//                 color: Colors.grey[500],
//               ),
//             ),
//           ],
//         ),
//       ),
//       /*3*/
//       Icon(
//         Icons.star,
//         color: Colors.red[500],
//       ),
//       const Text('41'),
//     ],
//   ),
// );
