import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travl/components/input.dart';
import 'package:travl/components/navbar.dart';
import 'package:travl/firebase_options.dart';
import 'package:travl/utils/c_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Register extends StatefulWidget {
  final String secTitle = 'Travl - Register';
  final String navTitle = 'Register';
  final double inputSpacingTop = 35;

  void onBack() {}

  @override
  RegisterState createState() => RegisterState();
}
// class RegisterState extends State<Register> {
//   // TextEditingController name = new TextEditingController();
// bool switchValue = false;

//   @override
// Widget build(BuildContext context) {
//   return CupertinoSwitch(
//     value: switchValue,
//     onChanged: (value) {
//       setState(() {
//         switchValue = value;
//       });
//     },
//   );
// }
// }

class RegisterState extends State<Register> {
  bool switchValue = false;
  bool loading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String emailError = '';

  late final _firstName = TextEditingController();
  late final _lastName = TextEditingController();
  late final _email = TextEditingController();
  late final _password = TextEditingController();

  void handleRegister() async {
    final email = _email.text;
    final password = _password.text;

    setState(() {
      loading = true;
      emailError = '';
    });

    void showErrorSnackBar(String errorMsg) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMsg)),
      );
    }

    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('\x1B[32m$credential\x1B[0m');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        setState(() {
          emailError = 'The account already exists for that email.';
        });
        showErrorSnackBar(emailError);
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
          debugShowCheckedModeBanner: false,
          title: widget.secTitle,
          home: CupertinoPageScaffold(child: Scaffold(body: _buildRegBody())));
    } else {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: widget.secTitle,
          home: Scaffold(body: _buildRegBody()));
    }
  }

  Widget _buildRegBody() {
    return ListView(children: [
      CNavBar(title: widget.navTitle, onBack: widget.onBack),
      Padding(
        padding: EdgeInsets.only(right: 20, left: 20, top: 40),
        child: Column(
          children: [
            CInput(
              labelText: 'First Name',
              hintText: 'Enter your first name',
              controller: _firstName,
              keyboardType: TextInputType.text,
            ),
            Padding(
              padding: EdgeInsets.only(top: widget.inputSpacingTop),
              child: CInput(
                labelText: 'Last Name',
                hintText: 'Enter your last name',
                controller: _lastName,
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: widget.inputSpacingTop),
              child: CInput(
                labelText: 'Email',
                hintText: 'Enter your email',
                controller: _email,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: widget.inputSpacingTop),
              child: CInput(
                labelText: 'Password',
                hintText: '8+ characters',
                controller: _password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (Platform.isIOS)
                    CupertinoSwitch(
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {
                          switchValue = value;
                          print(switchValue);
                        });
                      },
                    )
                  else
                    Checkbox(
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {
                          switchValue = value!;
                        });
                      },
                    ),
                  Text('I agree to the terms and conditions')
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 40),
                child: loading
                    ? CircularProgressIndicator()
                    : CButton(
                        text: 'Register',
                        onPressed: () => handleRegister(),
                        width: double.infinity,
                        height: 50,
                        color: Colors.white,
                        bgColor: Colors.blue[800]!)),
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Already have an account? ',
                        style: TextStyle(color: Colors.black)),
                    Text('Login here',
                        style: TextStyle(color: Colors.blue[900]!))
                  ],
                ))
          ],
        ),
      )
    ]);
  }
}





// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:travl/components/navbar.dart';
// import 'package:travl/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:travl/widgets/register_form.dart';

// class Register extends StatefulWidget {
// final String secTitle = 'Travl - Register';
// final String navTitle = 'Register';
// final double inputSpacingTop = 35;

//   void onBack() {}

//   @override
//   RegisterState createState() => RegisterState();
// }
// class RegisterState extends State<Register> {
//   // TextEditingController name = new TextEditingController();
// bool switchValue = false;

//   @override
// Widget build(BuildContext context) {
//   return CupertinoSwitch(
//     value: switchValue,
//     onChanged: (value) {
//       setState(() {
//         switchValue = value;
//       });
//     },
//   );
// }
// }

// class RegisterScreen extends StatelessWidget {
//   final String secTitle = 'Travl - Register';
//   final String navTitle = 'Register';
//   final double inputSpacingTop = 35;

//   void onBack() {}

//   @override
//   Widget build(BuildContext context) {
//     if (Platform.isIOS) {
//       return CupertinoApp(
//         debugShowCheckedModeBanner: false,
//         title: secTitle,
//         home: CupertinoPageScaffold(
//             child: ListView(
//           children: [
//             CNavBar(title: navTitle, onBack: onBack),
//             ..._buildRegBody()
//           ],
//         )),
//       );
//     } else {
//       return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: secTitle,
//           home: ListView(
//             children: [
//               CNavBar(title: navTitle, onBack: onBack),
//               ..._buildRegBody()
//             ],
//           ));
//     }
//   }

//   List<Widget> _buildRegBody() {
//     return [RegisterForm()];
//   }
// }











// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:travl/components/input.dart';
// import 'package:travl/components/navbar.dart';
// import 'package:travl/firebase_options.dart';
// import 'package:travl/utils/c_button.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

// class Register extends StatefulWidget {
//   final String secTitle = 'Travl - Register';
//   final String navTitle = 'Register';
//   final double inputSpacingTop = 35;

//   void onBack() {}

//   @override
//   RegisterState createState() => RegisterState();
// }
// // class RegisterState extends State<Register> {
// //   // TextEditingController name = new TextEditingController();
// // bool switchValue = false;

// //   @override
// // Widget build(BuildContext context) {
// //   return CupertinoSwitch(
// //     value: switchValue,
// //     onChanged: (value) {
// //       setState(() {
// //         switchValue = value;
// //       });
// //     },
// //   );
// // }
// // }

// class RegisterState extends State<Register> {
//   bool switchValue = false;
//   bool loading = false;
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   String emailError = '';

//   late final _firstName = TextEditingController();
//   late final _lastName = TextEditingController();
//   late final _email = TextEditingController();
//   late final _password = TextEditingController();

//   void handleRegister() async {
//     final email = _email.text;
//     final password = _password.text;

//     setState(() {
//       loading = true;
//       emailError = '';
//     });

//     void showErrorSnackBar(String errorMsg) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(errorMsg)),
//       );
//     }

//     try {
//       await Firebase.initializeApp(
//         options: DefaultFirebaseOptions.currentPlatform,
//       );
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       print('\x1B[32m$credential\x1B[0m');
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//         setState(() {
//           emailError = 'The account already exists for that email.';
//         });
//         showErrorSnackBar(emailError);
//       }
//     } catch (e) {
//       print(e);
//     } finally {
//       setState(() {
//         loading = false;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _firstName.dispose();
//     _lastName.dispose();
//     _email.dispose();
//     _password.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     if (Platform.isIOS) {
//       return CupertinoApp(
//         debugShowCheckedModeBanner: false,
//         title: widget.secTitle,
//         home: CupertinoPageScaffold(
//             child: ListView(
//           children: [
//             CNavBar(title: widget.navTitle, onBack: widget.onBack),
//             ..._buildRegBody()
//           ],
//         )),
//       );
//     } else {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: widget.secTitle,
//         home: Scaffold(
//           body: ListView(
//             children: [
//               CNavBar(title: widget.navTitle, onBack: widget.onBack),
//               ..._buildRegBody()
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   List<Widget> _buildRegBody() {
//     return [
//       CNavBar(title: widget.navTitle, onBack: widget.onBack),
//       Padding(
//         padding: EdgeInsets.only(right: 20, left: 20, top: 40),
//         child: Column(
//           children: [
//             CInput(
//               labelText: 'First Name',
//               hintText: 'Enter your first name',
//               controller: _firstName,
//               keyboardType: TextInputType.text,
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: widget.inputSpacingTop),
//               child: CInput(
//                 labelText: 'Last Name',
//                 hintText: 'Enter your last name',
//                 controller: _lastName,
//                 keyboardType: TextInputType.text,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: widget.inputSpacingTop),
//               child: CInput(
//                 labelText: 'Email',
//                 hintText: 'Enter your email',
//                 controller: _email,
//                 enableSuggestions: false,
//                 autocorrect: false,
//                 keyboardType: TextInputType.emailAddress,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: widget.inputSpacingTop),
//               child: CInput(
//                 labelText: 'Password',
//                 hintText: '8+ characters',
//                 controller: _password,
//                 keyboardType: TextInputType.visiblePassword,
//                 obscureText: true,
//                 enableSuggestions: false,
//                 autocorrect: false,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   if (Platform.isIOS)
//                     CupertinoSwitch(
//                       value: switchValue,
//                       onChanged: (value) {
//                         setState(() {
//                           switchValue = value;
//                           print(switchValue);
//                         });
//                       },
//                     )
//                   else
//                     Checkbox(
//                       value: switchValue,
//                       onChanged: (value) {
//                         setState(() {
//                           switchValue = value!;
//                         });
//                       },
//                     ),
//                   Text('I agree to the terms and conditions')
//                 ],
//               ),
//             ),
//             Padding(
//                 padding: const EdgeInsets.only(top: 40),
//                 child: loading
//                     ? CircularProgressIndicator()
//                     : CButton(
//                         text: 'Register',
//                         onPressed: () => handleRegister(),
//                         width: double.infinity,
//                         height: 50,
//                         color: Colors.white,
//                         bgColor: Colors.blue[800]!)),
//             Padding(
//                 padding: EdgeInsets.only(top: 30),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text('Already have an account? ',
//                         style: TextStyle(color: Colors.black)),
//                     Text('Login here',
//                         style: TextStyle(color: Colors.blue[900]!))
//                   ],
//                 ))
//           ],
//         ),
//       )
//     ];
//   }
// }


// -----------------------------------------------------------

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Widget titleSection = TitleSec(
//       title: 'Oeschinen Lake Campground',
//       description: 'Kandersteg, Switzerland',
//       descColor: Colors.grey[500],
//       iconColor: Colors.red[400],
//     );

//     Color color = Theme.of(context).primaryColor;

//     Widget buttonSection = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _buildButtonColumn(color, Icons.call, 'CALL'),
//         _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//         _buildButtonColumn(color, Icons.share, 'SHARE'),
//       ],
//     );

//     Widget textSection = Container(
//       padding: const EdgeInsets.all(32),
//       child: const Text(
//         'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
//         'Alps. Situated 1,578 meters above sea level, it is one of the '
//         'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
//         'half-hour walk through pastures and pine forest, leads you to the '
//         'lake, which warms to 20 degrees Celsius in the summer. Activities '
//         'enjoyed here include rowing, and riding the summer toboggan run.',
//         softWrap: true,
//       ),
//     );

//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter layout demo'),
//         ),
//         body: ListView(
//           children: [
//             HeroSec(imagePath: 'images/man-bird.jpeg', height: 250, width: 600),
//             titleSection,
//             buttonSection,
//             textSection,
//           ],
//         ),
//       ),
//     );
//   }

//   Column _buildButtonColumn(Color color, IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color),
//         Container(
//           margin: const EdgeInsets.only(top: 8),
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//               color: color,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

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

// -------------------------------------------------- //
// class HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     if (Platform.isIOS) {
//       return CupertinoApp(
//         title: widget.navTitle,
//         home: CupertinoTabScaffold(
//           tabBar: CupertinoTabBar(
//             items: [
//               BottomNavigationBarItem(
//                   icon: Icon(CupertinoIcons.list_bullet), label: 'Food'),
//               BottomNavigationBarItem(
//                   icon: Icon(CupertinoIcons.list_bullet), label: 'Non-food'),
//             ],
//           ),
//           tabBuilder: (context, index) {
//             return CupertinoPageScaffold(
//               navigationBar: CupertinoNavigationBar(
//                 leading: Row(
//                   children: [
//                     Expanded(
//                       child: Material(
//                         type: MaterialType.transparency,
//                         child: TabBar(
//                           tabs: [
//                             Tab(text: 'Food'), // The first tab
//                             Tab(text: 'Non-food'), // The second tab
//                           ],
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(CupertinoIcons.ant_circle),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//                 middle: Text(widget.navTitle),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     CupertinoButton(
//                       padding: EdgeInsets.zero,
//                       child: Icon(CupertinoIcons.search),
//                       onPressed: () {},
//                     ),
//                     CupertinoButton(
//                       padding: EdgeInsets.zero,
//                       child: Icon(CupertinoIcons.ellipsis),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//               child: Center(
//                 child: Text(index == 0 ? 'Food' : 'Non-food'),
//               ),
//             );
//           },
//         ),
//       );
//     } else {
//       return MaterialApp(
//         title: widget.navTitle,
//         home: DefaultTabController(
//           length: 2,
//           child: Scaffold(
//             appBar: AppBar(
//               title: Text(widget.navTitle),
//               actions: [
//                 IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: () {},
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.more_vert),
//                   onPressed: () {},
//                 ),
//               ],
//               bottom: TabBar(
//                 tabs: [
//                   Tab(text: 'Food'),
//                   Tab(text: 'Non-food'),
//                 ],
//               ),
//             ),
//             body: TabBarView(
//               children: [
//                 Center(child: Text('Food')),
//                 Center(child: Text('Non-food')),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   }
// }
