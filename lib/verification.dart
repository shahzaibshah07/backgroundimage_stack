import 'package:first_flutterapp/pinCode.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';

import 'profilePage.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController codeController = TextEditingController();
  late String _verificationCode;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.arrow_back_ios_new_outlined,
            color: Colors.grey,
            size:16),
        title: Text('Verification Page',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column (
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('We SENT THE CODE ',
                    style: TextStyle(color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text('To The Number You Entered',
                    style: TextStyle(color: Colors.grey,
                      fontSize: 10,),),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15 , left : 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('CODE',style:TextStyle(color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child:  Form(
                  key: _formkey,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: codeController,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.greenAccent,
                    autofocus: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-5]*$')),
                    ],
                    decoration:
                    InputDecoration(
                      labelText: 'Verification Code',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      fillColor: Colors.black,
                      focusColor: Colors.greenAccent,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(borderSide:
                      BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                    ),
                    onChanged: (value){
                      _verificationCode = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter valid Verification Code';
                      }

                      // Check if the phone number contains only numeric characters
                      if (!RegExp(r'^[0-5]+$').hasMatch(value)) {
                        return 'Invalid characters in Verification Code';
                      }

                      // Check if the phone number has the correct length
                      if (value.length != 5) {
                        return 'Verification Code must be of 5 digits';
                      }

                      // Additional conditions can be added as needed

                      return null;
                    },

                  ),
                ),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10 , right:16),
                    child: Text('Resend The Code',
                      style: TextStyle(color: Colors.greenAccent),),
                  ),
                ]),
            const SizedBox(height:16),
            InkWell(
              child: Container(
                width: 80,
                height : 30,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only( left: 15.0, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Submit',
                            style: TextStyle(fontSize:15,color: Colors.black )),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: (){
                if (_formkey.currentState!.validate()) {
                  print('Verification Code  = '+ _verificationCode);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PinCodePage()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
