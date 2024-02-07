import 'package:first_flutterapp/profilePage.dart';
import 'package:flutter/Material.dart';

class PinCodePage extends StatefulWidget {
  const PinCodePage({super.key});

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.arrow_back_ios_new_outlined,
            color: Colors.grey,
            size:16),
        title: Text('Pin Code',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,),
        ),
      ),
     body :  Center(
       child: InkWell(
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

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfilePage()),
              );
          },
        ),
     ),
    );
  }
}
