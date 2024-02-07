import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formkey = GlobalKey<FormState>();
   String? _name , _surname , _dob , _gender , _occupation;
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController dobController= TextEditingController();
  TextEditingController genderController= TextEditingController();
  TextEditingController occupationController= TextEditingController();
  List<String> dropdownItems = [
    'Male',
    'Female',
  ];


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.grey,
              size:16),
          title: Text('Profile',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column (
              children: [
                Padding(
                  padding: const EdgeInsets.only(right :20.0 , left : 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('FILL OUT THE PROFILE',
                          style: TextStyle(color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right : 20.0 , left: 20),
                  child: const Row(
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
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child:  TextFormField(
                              controller: nameController,
                              style: TextStyle(color: Colors.grey,fontSize: 12),
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.grey,
                              autofocus: false,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                              ],
                              decoration:
                              InputDecoration(
                                labelText: 'Full Name',
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
                                _name = value;
                              },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your full name';
                                  }
                                  return null;
                                },
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child:  TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                              ],
                              controller: surnameController ,
                              style: TextStyle(color: Colors.grey,fontSize: 12),
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.grey,
                              autofocus: false,
                              decoration:
                              InputDecoration(
                                labelText: 'Surname',
                                labelStyle: TextStyle(
                                    color:Colors.grey,
                                  fontSize: 12,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                fillColor: Colors.black,
                                focusColor: Colors.grey,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(borderSide:
                                BorderSide(color: Colors.grey),
                                ),
                                filled: true,
                              ),
                              onChanged: (value){
                                _surname = value;
                              },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your surname';
                                  }
                                  return null;
                                },
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child:  TextFormField(
                                controller: dobController,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9/\\]')),
                              ],
                              style: TextStyle(color: Colors.grey,fontSize: 12),
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.grey,
                              autofocus: false,
                              decoration:
                              InputDecoration(
                                labelText: 'Date Of Birth',
                                labelStyle: TextStyle(
                                  color:Colors.grey,
                                  fontSize: 12,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                fillColor: Colors.black,
                                focusColor: Colors.grey,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(borderSide:
                                BorderSide(color: Colors.grey),
                                ),
                                filled: true,
                              ),
                              onChanged: (value){
                                _dob = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your surname';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: DropdownButtonFormField(
                              value: _gender,

                              items: [
                                DropdownMenuItem(
                                  value: 'Male',
                                  child: Text('Male' , style: TextStyle(color: Colors.grey,fontSize: 12),),
                                ),
                                DropdownMenuItem(
                                  value: 'Female',
                                  child: Text('Female' ,style: TextStyle(color: Colors.grey,fontSize: 12),),
                                ),
                                DropdownMenuItem(
                                  value: 'Other',
                                  child: Text('Other',style: TextStyle(color: Colors.grey,fontSize: 12),),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _gender = value!;
                                });
                              },
                              dropdownColor: Colors.black,
                              decoration: InputDecoration(
                                labelText: 'Gender',
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                fillColor: Colors.black,
                                focusColor: Colors.grey,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                filled: true,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select your Gender';
                                }
                                return null;
                              },
                            ),
                        ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child:  TextFormField(
                              controller: occupationController,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                              ],
                              style: TextStyle(color: Colors.grey,fontSize: 12),
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.grey,
                              autofocus: false,
                              decoration:
                              InputDecoration(
                                labelText: 'Occupation',
                                labelStyle: TextStyle(
                                    color : Colors.grey,
                                  fontSize: 12,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                fillColor: Colors.black,
                                focusColor: Colors.grey,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(borderSide:
                                BorderSide(color: Colors.grey),
                                ),
                                filled: true,
                              ),
                              onChanged: (value){
                                _occupation = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Occupation';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height:16),
                InkWell(
                  child: Container(
                    width: 70,
                    height : 30,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only( left: 15.0, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Save',
                                style: TextStyle(fontSize:15,color: Colors.black )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    if (_formkey.currentState!.validate()) {
                      print('Name       =  ' + _name!);
                      print('Surname    = ' + _surname!);
                      print('Gender     =  ' + _gender!);
                      print('DOB        =' + _dob!);
                      print('Occupation = ' + _occupation!);


                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const ProfilePage()),
                      // );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}
