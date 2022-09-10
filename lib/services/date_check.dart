import 'package:flutter/material.dart';

class data{

  //Properties
  late List dates;
  dynamic date;
  dynamic month_name;
  dynamic year;
  dynamic month;
  dynamic date_limit;
  late bool check1;
  late bool check2;

  //Defined Lists
  List months = ['January','February','March','April','May','June','July','August','September','October','November','December'];
  List<int> month30 = [4,6,9,11];
  List<int> month31 = [1,3,5,7,8,10,12];

  //Constructor
  data(d,m,y,c1,c2){
    this.date=d;
    this.month_name=m;
    this.year=y;
    this.check1=c1;
    this.check2=c2;
  }

  //Methods

  bool checkinput(){
    if (check1 == false || check2 == false || date.isEmpty || month_name.isEmpty || year.isEmpty){
      return false;
    }
    else{
      return true;
    }
  }

  void datelimit(){
    month = months.indexOf(month_name)+1;
    year = int.parse(year!);
    date = int.parse(date!);
    if (month30.contains(month)){
      date_limit=30;
    }
    else if (month31.contains(month)){
      date_limit=31;
    }
    else{
      if (year!%4==0){
        date_limit=29;
      }
      else{
        date_limit=28;
      }
    }
  }

  String calculate(){
    month = months.indexOf(month_name)+1;
    year = int.parse(year!);
    date = int.parse(date!);
    List cennumbers = [2,0,5,3];
    int year1=((year~/100)%4);
    year1=cennumbers[year1];
    int year2=((year%100)~/12);
    int year3=(year%100)-(12*year2);
    int year4=year3~/4;
    dynamic cennumber0=year1+year2+year3+year4;
    cennumber0=cennumber0%7;
    List days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
    List nonleap = [3,28,14,4,9,6,11,8,5,10,7,12];
    List leap = [4,29,14,4,9,6,11,8,5,10,7,12];
    if (year%4==0){
      dynamic daydiff = date-leap[month-1];
      if (daydiff>0){
        cennumber0+=daydiff;
      }
      else{
        daydiff = daydiff.abs();
        daydiff = daydiff%7;
        cennumber0-=daydiff;
      }
    }
    else{
      dynamic daydiff = date-nonleap[month-1];
      if (daydiff>0){
        cennumber0+=daydiff;
      }
      else{
        daydiff = daydiff.abs();
        daydiff = daydiff%7;
        cennumber0-=daydiff;
      }
    }
    var day1=days[cennumber0%7];
    return day1;
  }

}