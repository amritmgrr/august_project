// import 'package:flutter/material.dart';
// import 'package:august/src/view/utilis/colors.dart';


// class LoginScreen extends StatefulWidget {
//   HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//  TextEditingController inputController = TextEditingController();
//   Color currentColor = kRedColor;
//   void colorChanger () {
//     switch(inputController.text.toLowerCase().trim())
//     {
//        case "red":
//         currentColor = kRedColor;
//        break;
//        case "blue":
//        currentColor = kBlueColor;
//        break;
//        default:
//        currentColor = kRedColor;
//        break;
//     }
//     setState(() {});
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Color Changer"),
//           centerTitle: true,
//           backgroundColor: kBlackColor,
//           elevation: 0,
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: TextField(
//                 controller: inputController,
//                 decoration: InputDecoration(
//                   labelText: "color name",
//                   suffixIcon: IconButton(
//                     onPressed: ()
//                     {
//                       colorChanger();
//                       //print(inputController.text);
//                     }, icon: Icon(Icons.arrow_forward)),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20)
//                   )
//                 ),
//                ),
//              ),
//              Container(
//               decoration: BoxDecoration(color: currentColor, shape: BoxShape.circle),
//               height: 200,
//               width: 200,
//               // color: currentColor,
//              )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:august/src/view/screens/register.dart';
import 'package:august/src/view/screens/home.dart';
import 'package:august/src/view/utilis/reg_ex.dart';
import 'package:august/src/view/utilis/texts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailinputController = TextEditingController();
  TextEditingController _passwordinputController = TextEditingController();

  final formKey = GlobalKey<FormState>();

 bool hidepassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(appName),
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Home Screen",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: 
                        TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                          height: 10,
                        ),
                  TextFormField(
                    controller: _emailinputController,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return"This field is required";
                    }
                    else if(!emailValidation.hasMatch(value)){
                      return"Please enter your email";
                    }
                    
                
                  
                    // else if (!value.contains("@")) {
                    //   return"Please enter a valid email55";
                    // }
                    
                    else{
                      return null;
                    }
                    },
                    // obscureText: hidepassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      // suffixIcon: IconButton(
                      //   onPressed: () {
                      //     hidepassword = !hidepassword;
                      //     setState(() {});
                      //   },
                      //   // icon: Icon(hidepassword
                      //   //          ? Icons.remove_red_eye
                      //   //          :Icons.remove_red_eye_outlined)
                      //            ),
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20))),
                  ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Password"
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _passwordinputController,
                    validator: (value){
                        if(value == null || value.isEmpty){
                          return"This field is required";
                      }
                      else if(!passwordValidation.hasMatch(value)){
                        return"Please enter your password";
                      }
                       else{
                        return null;
                      }
                    },
                    obscureText: hidepassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            hidepassword = !hidepassword;
                            setState(() {});
                          },
                          icon: Icon(hidepassword
                                   ? Icons.remove_red_eye
                                   :Icons.remove_red_eye_outlined)),
                          hintText: "Enter your password",
                          border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20))),
                
                
                  ),
                ),
                ],
              ),

            ),
            ),
          ElevatedButton(
            onPressed: () {
              if(formKey.currentState!.validate()){
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomeScreen(
                      title: _emailinputController.text,
              )));
            }
          }, 
          child: Text("Log in")),
          RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Not registered ?",
              style:TextStyle(color: Colors.black)),
          TextSpan(
              text: "Register",
              recognizer: TapGestureRecognizer()
              ..onTap = (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RegisterScreen()));
              },
              style: TextStyle(
                color: Colors.blue,fontWeight: FontWeight.bold)),
          ])),
        ],
      ),
    ),
    );
  }
}