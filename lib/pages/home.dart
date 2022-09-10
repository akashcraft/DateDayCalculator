import 'package:flutter/material.dart';
import 'package:datedaycalculator/services/date_check.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'package:datedaycalculator/services/settings.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  bool check1 = false;
  bool check2 = false;
  Color? mainaccent = Colors.orange;
  data instance1 = data(1,'January',1700,false,false);
  String? inputmonth = 'January';
  String? output = '';
  String? output1 = '';
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  String? language = 'English';
  bool? theme = true;
  String? color = 'Orange';

  @override
  void initState() {
    read();
  }

  @override
  Widget build(BuildContext context) {
    settings instance = settings(language, theme, color);

    String convertmonth(a){
      return instance.langmonthlist()![instance1.months.indexOf(a)];
    }
    String _5(){
      return instance.langlist()![5];
    }
    String _6(){
      return instance.langlist()![6];
    }

    return Scaffold(
      backgroundColor: instance.themepicker(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(instance.langlist()![0], style: TextStyle(fontSize: 25),),
        backgroundColor: instance.accentpicker(),
      ),
      body: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                  child: Text(
                    instance.langlist()![1],
                    style: TextStyle(
                      fontSize: 20,
                      color: instance.subfontpicker(),
                    ),
                  ),
                ),
              ],
            ),
            Card(
              
              color: instance.subsubfontpicker(),
              margin: EdgeInsets.fromLTRB(20,10,20,0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      width: 110,
                      child: TextFormField(
                        controller: controller1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: instance.subfontpicker()!),
                          labelText: instance.langlist()![2],
                          counterText: '',
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) {
                          if (RegExp(r'[0-9]').hasMatch(v!) && (int.parse(v)>0 && int.parse(v)<32)){
                            check1 = true;
                            return null;
                          }
                          else{
                            check1 = false;
                            return instance.langlist()![4];
                          }
                        },
                        onChanged: (v) {
                          if (check1!=true){
                            output='';
                            output1 = '';
                            setState(() {});
                          }
                        },
                        style: TextStyle(
                          fontSize: 20,
                          color: instance.fontpicker(),
                        ),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                      ),
                    ),
                    Container(
                        width: 120,
                        child: DropdownButton(
                          dropdownColor: instance.subsubfontpicker(),
                          isExpanded: true,
                          style: TextStyle(
                            fontSize: 20,
                            color: instance.fontpicker()),
                            value: inputmonth,
                            onChanged: (String? selected) {
                            setState((){
                              inputmonth = selected;
                            });
                            },

                            items: instance1.months.map((dynamic value) {
                              return DropdownMenuItem<String>(
                                  child: Text(convertmonth(value)),
                                  value: value,);
                            }).toList(),
                        )
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      width: 110,
                      child: TextFormField(
                        controller: controller2,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: instance.langlist()![3],
                          labelStyle: TextStyle(color: instance.subfontpicker()!),
                          counterText: '',
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(
                          fontSize: 20,
                          color: instance.fontpicker(),
                        ),
                        validator: (v) {
                          if (RegExp(r'[0-9]').hasMatch(v!) && int.parse(v)>1599){
                            check2 = true;
                            return null;
                          }
                          else{
                            check2 = false;
                            output = '';
                            output1 = '';
                            return instance.langlist()![4];
                          }
                        },
                        onChanged: (v) {
                          if (check2 != true) {
                            output = '';
                            output1 = '';
                            setState(() {});
                          };
                        },
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        maxLength: 4,
                      ),
                    ),
                  ],
                ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 70, 0, 10),
              child: Text(
                  '$output',
                  style: TextStyle(
                  fontSize: 60,
                  color: instance.fontpicker()
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 80),
              child: Text(
                '$output1',
                style: TextStyle(
                    fontSize: 15,
                    color: instance.subfontpicker()
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(2),
              child: TextButton.icon(
                  onPressed: () {
                    data instance3 = data(controller1.text, inputmonth, controller2.text, check1, check2);
                    if (instance3.checkinput()) {
                      instance3.datelimit();
                      if (int.parse(controller1.text) > instance3.date_limit) {
                        final snackbar = SnackBar(content: Text(_5()),backgroundColor: Colors.green,);
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        controller1.text = instance3.date_limit.toString();
                      }
                      data instance1 = data(controller1.text, inputmonth, controller2.text, true, true);
                      output = instance.langdaylist(instance1.calculate());
                      output1 = controller1.text+' '+convertmonth(inputmonth)+' '+controller2.text;
                      setState(() {});
                    }
                      else {
                      final snackbar = SnackBar(content: Text(_6()),backgroundColor: Colors.red,);
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    },
                  icon: Icon(Icons.check,size: 30,),
                  label: Text(instance.langlist()![7],style: TextStyle(fontSize: 18),),
                  style: TextButton.styleFrom(backgroundColor: instance.accentpicker(), primary: Colors.white)
              ),
              width: 210,
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(2),
              child: TextButton.icon(
                onPressed: () {
                  inputmonth = instance1.months[Random().nextInt(11)];
                  output = '';
                  output1 = '';
                  setState(() {});
                  controller1.text = (1+Random().nextInt(31)).toString();
                  controller2.text = (1800+Random().nextInt(350)).toString();
                },
                icon: Icon(Icons.shuffle, size: 30,),
                label: Text(instance.langlist()![8],style: TextStyle(fontSize: 18),),
                style: TextButton.styleFrom(backgroundColor: instance.accentpicker(), primary: Colors.white)
              ),
              width: 210,
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(2),
              child: TextButton.icon(
                  onPressed: (output!.isEmpty) ? null : () {_launchURLBrowser();},
                  icon: Icon(Icons.language, size: 30),
                  label: Text(instance.langlist()![9],style: TextStyle(fontSize: 18),),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue[900], primary: Colors.white),

              ),
              width: 210,
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(2),
              child: TextButton.icon(
                  onPressed: () async {
                    await Navigator.pushNamed(context,'/about');
                    output1 = '';
                    output = '';
                    read();
                    setState(() {});
                  },
                  icon: Icon(Icons.settings, size: 30),
                  label: Text(instance.langlist()![10],style: TextStyle(fontSize: 18),),
                  style: TextButton.styleFrom(backgroundColor: instance.accentpicker(), primary: Colors.white)
              ),
              width: 210,
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(2),
              child: TextButton.icon(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  icon: Icon(Icons.logout, size: 30),
                  label: Text(instance.langlist()![11],style: TextStyle(fontSize: 16),),

                  style: TextButton.styleFrom(backgroundColor: Colors.red[900], primary: Colors.white)

              ),
              width: 210,
              height: 50,
            ),
          ],
        ),
      );
  }
  _launchURLBrowser() async {
    String url = 'https://www.google.com/search?q=${controller1.text}+$inputmonth+${controller2.text}+Day';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  read() async {
    List settings = [];
    final prefs = await SharedPreferences.getInstance();
    language = prefs.getString('Language') ?? 'English';
    theme = prefs.getBool('Theme') ?? true;
    color = prefs.getString('Color') ?? 'Orange';
    setState(() {});
  }
}
