// import 'package:flutter/material.dart';

// class Login extends StatefulWidget {
//   @override
//   State createState() =>  _LoginState();
// }

//   class _LoginState extends State<Login> {
//     bool isLoginForm = true;
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         body: 
//         Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('images/Background.jpeg'),
//                 fit: BoxFit.cover,
//           ),
//         ),
//       ),
//            ListView(
//             children: [
//             showHeader(),
//             showEmailInput(),
//             showPasswordInput(),
//             showPrimaryButton(context),
//             showSecondaryButton(),
//           ],
//         ),
//         ],
//         )
//       );  
//     }
//   }
//   Widget showHeader(){
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
//       child: 
//         Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//         Text("BB Saves", style:TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500, color: Colors.white
//         ),
//     ),
//         SizedBox(height: 25),
//         Text("Save and organize your tasks and project ideas on BB Saves", 
//         textAlign: TextAlign.center,
//         style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.w100, color: Colors.white
//         ),
//             ),
//         ]
//     ),
//     );
//   }

//   Widget showEmailInput(){
//     var _email;
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0.0,80.0,0.0,0.0),
//       child: Card(
//       color: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(5.0),
//       ),
//       child: TextFormField(
//         maxLines: 1,
//         keyboardType: TextInputType.emailAddress,
//         autofocus: false,
//         decoration: InputDecoration(
//           hintText: 'We promise not to tell',
//           labelText: 'Enter your email/ Username',
//           icon : Icon(
//             Icons.mail,
//             color: Colors.grey,
//           ),                                                                                                                          
//       ),
//       validator: (value) => value.isEmpty ? 'Email can\'t be empty':null,
//       onSaved: (value) => _email.trim(),
//       ),
//     )
//     );
//   }

// Widget showPasswordInput(){
//   String _password;
//   return Padding(
//     padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
//     child: Card(
//       color: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(5.0),
//       ),
//       child: TextFormField(
//         autofocus: false,
//         maxLines: 1,
//         obscureText: true,
//         decoration: InputDecoration(
//         hintText: 'Make sure it\'s private',
//         labelText: 'Password',
//         icon: Icon(
//           Icons.lock,
//           color: Colors.grey
//       ),
//         ),
//       validator: (value) => value.isEmpty ? 'Password can\'t be empty': null,
//       onSaved: (value)=> _password.trim(),
//     ),
//     ),
//     );

// }

// Widget showPrimaryButton(BuildContext context){
//   return Padding(
//     padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
//     child: SizedBox(
//       height: 40.0,
//       child: RaisedButton(
//         elevation: 5.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//           ),
//         color: Colors.blue,
//         child: Text('Login',
//         style: TextStyle(fontSize: 20.0, color: Colors.white),
//         ),
//         onPressed: (){
//           Navigator.push(
//           context, 
//           MaterialPageRoute(
//             builder: (context) => Home(),),
//             );
//         },
//         ),
//       ),
//     );
// }

// Widget showSecondaryButton(){
//   return Padding(
//     padding: EdgeInsets.fromLTRB(0.0,20.0,0.0,0.0),
//     child: RaisedButton(
//         elevation: 5.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//           ),
//         color: Colors.blue,
//         child: Text('Create new account',
//         style: TextStyle(fontSize: 18.0, color: Colors.white),
//         ),
//       onPressed: (){
//         Text("Hold on");
//       }
//   )
//   );
// }
