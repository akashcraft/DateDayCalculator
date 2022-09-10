import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:datedaycalculator/services/settings.dart';
import 'package:url_launcher/url_launcher.dart';


class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override

  String? selectedlanguage = 'English';
  bool? selectedtheme = true;
  String? selectedcolor = 'Orange';

  Widget build(BuildContext context) {
    read();
    settings instance = settings(selectedlanguage, selectedtheme, selectedcolor);

    return Scaffold(
      backgroundColor: instance.themepicker(),
      appBar: AppBar(
        title: Text(instance.aboutlanglist()![0],style: TextStyle(fontSize: 25),),
        backgroundColor: instance.accentpicker(),
      ),
      body: Column(
          children: [
            Card(
              color: instance.subsubfontpicker(),
              margin: EdgeInsets.fromLTRB(20,20,20,0),
              child: ListTile(
                  title: Text(instance.aboutlanglist()![1],style: TextStyle(fontSize: 20,color: instance.fontpicker()),),
                  leading: Icon(Icons.language, size: 30,color: instance.fontpicker()),
                  subtitle: Text('$selectedlanguage',style: TextStyle(fontSize: 15,color: instance.accentpicker())),
                  onTap: () {showDialog(context: context, builder: (context) {return
                    AlertDialog(
                      backgroundColor: instance.subsubfontpicker(),
                      title: Text(instance.aboutlanglist()![2],style: TextStyle(color: instance.fontpicker(),fontSize: 25)),
                      content: SizedBox(
                        height: 280,
                        child: Column(
                            children: [
                              ListTile(
                                title: Text('English (UK)',style: TextStyle(color: instance.fontpicker(),fontSize: 20)),
                                leading: Radio<String>(fillColor: MaterialStateColor.resolveWith((states) => instance.accentpicker()!), value: 'English', groupValue: selectedlanguage, onChanged: (v) {selectedlanguage = 'English'; _save();},),
                                onTap: () {selectedlanguage = 'English'; _save();},
                              ),
                              ListTile(
                                title: Text('Français',style: TextStyle(color: instance.fontpicker(),fontSize: 20)),
                                leading: Radio<String>(fillColor: MaterialStateColor.resolveWith((states) => instance.accentpicker()!), value: 'Français', groupValue: selectedlanguage, onChanged: (v) {selectedlanguage = v!; _save();},),
                                onTap: () {selectedlanguage = 'Français'; _save();},
                              ),
                              ListTile(
                                title: Text('हिन्दी',style: TextStyle(color: instance.fontpicker(),fontSize: 20)),
                                leading: Radio<String>(fillColor: MaterialStateColor.resolveWith((states) => instance.accentpicker()!), value: 'हिन्दी', groupValue: selectedlanguage, onChanged: (v) {selectedlanguage = v!; _save();},),
                                onTap: () {selectedlanguage = 'हिन्दी'; _save();},
                              ),
                              ListTile(
                                title: Text('বাংলা',style: TextStyle(color: instance.fontpicker(),fontSize: 20)),
                                leading: Radio<String>(fillColor: MaterialStateColor.resolveWith((states) => instance.accentpicker()!), value: 'বাংলা', groupValue: selectedlanguage, onChanged: (v) {selectedlanguage = v!; _save();},),
                                onTap: () {selectedlanguage = 'বাংলা'; _save();},
                              ),
                              ListTile(
                                title: Text('한국어',style: TextStyle(color: instance.fontpicker(),fontSize: 20)),
                                leading: Radio<String>(fillColor: MaterialStateColor.resolveWith((states) => instance.accentpicker()!), value: '한국어', groupValue: selectedlanguage, onChanged: (v) {selectedlanguage = v!; _save();},),
                                onTap: () {selectedlanguage = '한국어'; _save();},
                              ),

                            ]
                        ),
                      ),
                    );
                  },
                  );}
              ),),
            Card(
                color: instance.subsubfontpicker(),
                margin: EdgeInsets.fromLTRB(20,10,20,0),
                child: ListTile(
                    title: Text(instance.aboutlanglist()![3],style: TextStyle(fontSize: 20,color: instance.fontpicker()),),
                    leading: Icon(Icons.palette, size: 30,color: instance.fontpicker()),
                    subtitle: Text(instance.aboutconvert(themedisplay(selectedtheme))!,style: TextStyle(fontSize: 15,color: instance.accentpicker())),
                    onTap: () {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          backgroundColor: instance.subsubfontpicker(),
                          title: Text(instance.aboutlanglist()![4],style: TextStyle(color: instance.fontpicker(),fontSize: 25)),
                          content: SizedBox(
                              height: 115,
                              child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(instance.aboutlanglist()![5],style: TextStyle(color: instance.fontpicker(),fontSize: 20)),
                                      leading: Radio<bool>(fillColor: MaterialStateColor.resolveWith((states) => instance.accentpicker()!), value: true, groupValue: selectedtheme, onChanged: (v) {selectedtheme = v!; _save();},),
                                      onTap: () {selectedtheme = true; _save();},
                                    ),
                                    ListTile(
                                      title: Text(instance.aboutlanglist()![6],style: TextStyle(color: instance.fontpicker(),fontSize: 20)),
                                      leading: Radio<bool>(fillColor: MaterialStateColor.resolveWith((states) => instance.accentpicker()!), value: false, groupValue: selectedtheme, onChanged: (v) {selectedtheme = v!; _save();},),
                                      onTap: () {selectedtheme = false; _save();},
                                    ),
                                  ])
                          ),
                        );
                      }
                      );
                    }
                )
            ),
            Card(
              color: instance.subsubfontpicker(),
              margin: EdgeInsets.fromLTRB(20,10,20,0),
              child: ListTile(
                title: Text(instance.aboutlanglist()![7],style: TextStyle(fontSize: 20,color: instance.fontpicker()),),
                leading: Icon(Icons.brush, size: 30,color: instance.fontpicker()),
                subtitle: Text(instance.aboutconvert(selectedcolor)!,style: TextStyle(fontSize: 15,color: instance.accentpicker())),
                onTap: () {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                        backgroundColor: instance.subsubfontpicker(),
                        title: Text(instance.aboutlanglist()![8],style: TextStyle(color: instance.fontpicker(),fontSize: 25)),
                        content: StatefulBuilder(builder: (context, setState) {return SizedBox(
                            height: 448,
                            child: Column(
                                children: [
                                  ListTile(
                                    title: Text(instance.aboutlanglist()![9],style: TextStyle(color: instance.fontpicker(),fontSize: 20)),
                                    leading: Radio<String>(fillColor: MaterialStateColor.resolveWith((states) => instance.accentpicker()!),value: 'Orange', groupValue: selectedcolor, onChanged: (v) {selectedcolor = v!; _save();},),
                                    onTap: () {selectedcolor = 'Orange'; _save();},
                                  ),
                                  ListTile(
                                    title: Text(instance.aboutlanglist()![10],style: TextStyle(color: instance.fontpicker(),fontSize: 20)),
                                    leading: Radio<String>(fillColor: MaterialStateColor.resolveWith((states) => instance.accentpicker()!),value: 'Green', groupValue: selectedcolor, onChanged: (v) {selectedcolor = v!; _save();},),
                                    onTap: () {selectedcolor = 'Green'; _save();},
                                  ),
                                  ListTile(
                                    title: Text(instance.aboutlanglist()![11],style: TextStyle(color: instance.fontpicker(),fontSize: 20)),
                                    leading: Radio<String>(fillColor: MaterialStateColor.resolveWith((states) => instance.accentpicker()!), value: 'Blue', groupValue: selectedcolor, onChanged: (v) {selectedcolor = v!; _save();},),
                                    onTap: () {selectedcolor = 'Blue'; _save();},
                                  ),
                                  ListTile(
                                    title: Text(instance.aboutlanglist()![12],style: TextStyle(color: instance.fontpicker(),fontSize: 20)),
                                    leading: Radio<String>(fillColor: MaterialStateColor.resolveWith((states) => instance.accentpicker()!), value: 'Red', groupValue: selectedcolor, onChanged: (v) {selectedcolor = v!; _save();},),
                                    onTap: () {selectedcolor = 'Red'; _save();},
                                  ),
                                  ListTile(
                                    title: Text(instance.aboutlanglist()![13],style: TextStyle(color: instance.fontpicker(),fontSize: 20)),
                                    leading: Radio<String>(fillColor: MaterialStateColor.resolveWith((states) => instance.accentpicker()!), value: 'Violet', groupValue: selectedcolor, onChanged: (v) {selectedcolor = v!; _save();},),
                                    onTap: () {selectedcolor = 'Violet'; _save();},
                                  ),
                                  ListTile(
                                    title: Text(instance.aboutlanglist()![14],style: TextStyle(color: instance.fontpicker(),fontSize: 20)),
                                    leading: Radio<String>(fillColor: MaterialStateColor.resolveWith((states) => instance.accentpicker()!), value: 'Pink', groupValue: selectedcolor, onChanged: (v) {selectedcolor = v!; _save();},),
                                    onTap: () {selectedcolor = 'Pink'; _save();},
                                  ),
                                  ListTile(
                                    title: Text(instance.aboutlanglist()![15],style: TextStyle(color: instance.fontpicker(),fontSize: 20)),
                                    leading: Radio<String>(fillColor: MaterialStateColor.resolveWith((states) => instance.accentpicker()!), value: 'Grey', groupValue: selectedcolor, onChanged: (v) {selectedcolor = v!; _save();},),
                                    onTap: () {selectedcolor = 'Grey'; _save();},
                                  ),
                                  ListTile(
                                    title: Text(instance.aboutlanglist()![16],style: TextStyle(color: instance.fontpicker(),fontSize: 20)),
                                    leading: Radio<String>(fillColor: MaterialStateColor.resolveWith((states) => instance.accentpicker()!), value: 'Indigo', groupValue: selectedcolor, onChanged: (v) {selectedcolor = v!; _save();},),
                                    onTap: () {selectedcolor = 'Indigo'; _save();},
                                  ),
                                ])
                        );})
                    );
                  }
                  );
                },
              ),
            ),
            Card(
                color: instance.subsubfontpicker(),
                margin: EdgeInsets.fromLTRB(20,10,20,0),
                child: ListTile(
                    title: Text(instance.aboutlanglist()![17], style: TextStyle(fontSize: 20, color: instance.fontpicker())),
                    leading: Icon(Icons.text_snippet, size: 30,color: instance.fontpicker()),
                    subtitle: Text(instance.aboutlanglist()![18],style: TextStyle(fontSize: 15,color: instance.accentpicker())),
                    onTap: () {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                            actions: [TextButton(onPressed: () {_launchURLBrowser();}, child: Text(instance.aboutlanglist()![20],style: TextStyle(fontSize: 15 ,color: instance.accentpicker())))
                              ,TextButton(onPressed: () {Navigator.pop(this.context);}, child: Text(instance.aboutlanglist()![19],style: TextStyle(fontSize: 15 ,color: instance.accentpicker()))),
                            ],
                            backgroundColor: instance.subsubfontpicker(),
                            title: Text(instance.aboutlanglist()![21],style: TextStyle(fontSize: 25,color: instance.fontpicker())),
                            content: Text(
                              instance.aboutlanglist()![22], style: TextStyle(fontSize: 20,color: instance.fontpicker()),
                            )
                        );
                      });}
                )
            ),
            Container(
              margin: EdgeInsets.only(top: 250),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(instance.aboutlanglist()![23],style: TextStyle(fontSize: 15,color: instance.subfontpicker())),
                  Text(instance.aboutlanglist()![24],style: TextStyle(fontSize: 15,color: instance.subfontpicker())),
                  SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(backgroundImage: AssetImage('assets/1.jpeg')),
                        SizedBox(width: 8),
                        Text('AkashCraft',style: TextStyle(fontSize: 20,color: instance.subfontpicker())),
                      ]
                  ),
                ],
              ),
            )
          ]
      ),
    );
  }

  String themedisplay(bool){
    if (bool){
      return 'Light';
    } else {
      return 'Dark';
    }
  }
  save(Language,Theme,Color) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('Language', Language);
    prefs.setBool('Theme', Theme);
    prefs.setString('Color', Color);
  }
  void _save() {
    Navigator.pop(this.context);
    save(selectedlanguage, selectedtheme, selectedcolor);
  }

  read() async {
    List settings = [];
    final prefs = await SharedPreferences.getInstance();
    selectedlanguage = prefs.getString('Language') ?? 'English';
    selectedtheme = prefs.getBool('Theme') ?? true;
    selectedcolor = prefs.getString('Color') ?? 'Orange';
    setState(() {});
  }
  _launchURLBrowser() async {
    String url = 'https://www.youtube.com/c/AkashCraft2';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}


