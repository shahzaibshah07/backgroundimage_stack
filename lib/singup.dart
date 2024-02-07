import 'package:first_flutterapp/verification.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  TextEditingController phoneNumberController = TextEditingController();
  late String _phoneNumber;
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
        title: Text('Sign In',
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
                Text('Enter Your Phone Number',
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
                  child: Text('To Log In And A User Of Application',
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
                  Text('Phone Number',style:TextStyle(color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 2.0),
                child:  Form(
                  key: _formkey,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.greenAccent,
                    autofocus: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
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
                        _phoneNumber = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Phone Number';
                      }

                      // Check if the phone number contains only numeric characters
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Invalid characters in Phone Number';
                      }

                      // Check if the phone number has the correct length
                      if (value.length != 11) {
                        return 'Phone Number must be of 11 digits';
                      }

                      // Additional conditions can be added as needed

                      return null;
                    },

                  ),
                ),
              ),
            ),
            const SizedBox(height:16),
            InkWell(
              child: Container(
                width: 100,
                height : 40,
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
                        Text('Log In',
                            style: TextStyle(fontSize:15,color: Colors.black )),
                      Icon(Icons.login_outlined,
                      size: 15,),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: (){
                if (_formkey.currentState!.validate()) {
                  print('Phone Number =  '  + _phoneNumber);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerificationPage()),
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
