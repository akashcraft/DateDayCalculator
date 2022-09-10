import 'package:flutter/material.dart';

class settings{
  Color? font;
  Color? accent;
  Color? subfont;
  String? language;
  bool? theme;
  String? color;

  List home_eng = ['Date Day Calculator','Input Date:','Date','Year','Invalid','Corrections Applied Automatically','Inputs Invalid. Please Check Again.','Calculate Day','Randomize','Check Online','Settings','Exit App'];
  List home_hin = ['दिनांक और दिन कैलकुलेटर','तारीख दर्ज करें:','दिनांक','साल','गलत','करेक्शन किए गए हैं','इनपुट अमान्य। कृपया दोबारा जांच करें।','दिन की गणना करें','रैंडमाइज़ करे','ऑनलाइन चेक करें','सेटिंग्स','ऐप से बाहर निकलें'];
  List home_ben = ['তারিখ এবং দিন ক্যালকুলেটর','তারিখ ইনপুট করুন:','তারিখ','বছর','ভুল','সংশোধন প্রয়োগ করা হয়েছে','ইনপুটগুলি অবৈধ৷ আবার চেষ্টা করুন','তারিখ গণনা করুন','এলোমেলো করুন','অনলাইন চেক করুন','সেটিংস','অ্যাপ থেকে প্রস্থান করুন'];
  List home_fra = ['Date Jour Calculatrice','Saisissez la date:','Date','Année','Invalide','Corrections appliquées automatiquement','Entrées Invalides. Veuillez vérifier à nouveau.','Calculer le jour','Randomiser','Vérifier en ligne','Paramètres','Quitter l\'application'];
  List home_kor = ['날짜 날짜 계산기','날짜 입력:','날짜','연도','잘못된','수정이 자동으로 적용됨','잘못 입력되었습니다. 다시 확인하십시오.','날짜 계산','무작위','온라인 확인','설정','앱 종료'];

  List days_eng = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
  List days_hin = ['रविवार','सोमवार','मंगलवार','बुधवार','गुरूवार','शुक्रवार','शनिवार'];
  List days_ben = ['রবিবার','সোমবার','মঙ্গলবার','বুধবার','বৃহস্পতিবার','শুক্রবার','শনিবার'];
  List days_fra = ['Dimanche', 'Lundi' ,'Mardi' ,'Mercredi' ,'Jeudi', 'Vendredi', 'Samedi'];
  List days_kor = ['일요일', '월요일', '화요일', '수요일', '목요일' ,'금요일' ,'토요일'];

  List color_pallette = ['Orange','Green','Blue','Red','Violet','Pink','Grey','Indigo'];

  List months_eng = ['January','February','March','April','May','June','July','August','September','October','November','December'];
  List months_hin = ['जनवरी', 'फरवरी', 'मार्च', 'अप्रैल', 'मई', 'जून', 'जुलाई', 'अगस्त', 'सितंबर', 'अक्टूबर', 'नवंबर', 'दिसंबर'];
  List months_ben = ['জানুয়ারি', 'ফেব্রুয়ারি', 'মার্চ', 'এপ্রিল', 'মে', 'জুন', 'জুলাই', 'আগস্ট', 'সেপ্টেম্বর', 'অক্টোবর', 'নভেম্বর', 'ডিসেম্বর'];
  List months_fra = ['Janvier','Février','Mars','Avril','Mai','Juin','Juillet','Août','Septembre','Octobre','Novembre','Décembre'];
  List months_kor = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];

  List about_eng = ['Settings','Language','Choose a Language','Theme','Choose a Theme','Light','Dark','Accent Colour','Choose a Colour','Orange','Green','Blue','Red','Violet','Pink','Grey','Indigo','About','Open','OK','YOUTUBE','Word from Developer','It’s been my absolute pleasure to present you this app. If you enjoy my works, support me by buying me a cup of coffee. Thank you for using this app.','Version 2.5.0','App Developed By'];
  List about_hin = ['सेटिंग्स', 'भाषा','भाषा बदलें', 'थीम','थीम बदलें', 'लाइट', 'डार्क', 'एक्सेंट कलर','रंग बदलें','ऑरेंज', 'ग्रीन', 'ब्लू', 'रेड', 'वायलेट', 'पिंक', 'ग्रे', 'इंडिगो','जानकारी', 'खोलें', 'ठीक है','यूट्यूब','डेवलपर से शब्द','आपको यह ऐप पेश करते हुए मुझे पूरी खुशी हो रही है। यदि आप मेरे कामों का आनंद लेते हैं, तो मुझे एक कप कॉफी खरीदकर मेरा समर्थन करें। इस ऐप का उपयोग करने के लिए धन्यवाद।', 'संस्करण 2.5.0', 'ऐप डेवलप्ड बाय'];
  List about_ben = ['সেটিংস', 'ভাষা', 'ভাষা পরিবর্তন করুন','থিম', 'থিম পরিবর্তন করুন','আলো', 'অন্ধকার', 'অ্যাকসেন্ট কালার', 'রঙ পরিবর্তন করুন','কমলা', 'সবুজ', 'নীল', 'লাল', 'ভায়োলেট', 'পিঙ্ক', 'গ্রে', 'ইন্ডিগো', 'সন্দেশ','খুলুন', 'ঠিক আছে','ইউটিউব','ডেভেলপার থেকে শব্দ','আপনাকে এই অ্যাপটি উপস্থাপন করতে পেরে আমার পরম আনন্দ হয়েছে। আপনি যদি আমার কাজগুলি উপভোগ করেন তবে আমাকে এক কাপ কফি কিনে সমর্থন করুন। এই অ্যাপটি ব্যবহার করার জন্য আপনাকে ধন্যবাদ।','সংস্করণ 2.5.0', 'অ্যাপ ডেভেলপড বাই'];
  List about_fra = ['Paramètres','Langue','Choisir une langue','Thème','Choisir un thème','Clair','Sombre','Couleur d\'accentuation','Choisir une couleur','Orange','Vert ','Bleu','Rouge','Violet','Rose','Gris','Indigo','À propos','Ouvrir','OK','YOUTUBE','Mot du développeur','C\'est été mon plaisir absolu de vous présenter cette application. Si vous aimez mes œuvres, soutenez-moi en m\'achetant une tasse de café. Merci d\'utiliser cette application.','Version 2.5.0','Application développée par'];
  List about_kor = ['설정', '언어', '언어 선택', '테마', '테마 선택', '밝게', '어두움', '강조 색상', '색상 선택', '주황색', '녹색 ','블루', '레드', '바이올렛', '핑크', '그레이', '남색', '어바웃', '오픈', 'OK', 'YOUTUBE', '개발자의 말', '그것 당신에게 이 앱을 선물하게 되어 정말 기쁩니다. 제 작품이 마음에 든다면 커피 한 잔 사서 응원해주세요. 이 앱을 이용해 주셔서 감사합니다.','버전 2.5.0','앱 개발사'];

  List<Color> accentcolor = [Colors.deepOrange,Colors.green,Colors.blue,Colors.red,Colors.purple,Colors.pinkAccent,Colors.blueGrey,Colors.indigo];


  settings(language, theme, color){
    this.language = language;
    this.theme = theme;
    this.color = color;
  }

  String? aboutconvert(a){
    if (language=='English'){
      return a;
    } else if (language=='हिन्दी'){
      return about_hin[about_eng.indexOf(a)];
    } else if (language=='Français'){
      return about_fra[about_eng.indexOf(a)];
    } else if (language=='한국어'){
      return about_kor[about_eng.indexOf(a)];
    } else {
      return about_ben[about_eng.indexOf(a)];
    }
  }

  String? langdaylist(a){
    if (language=='English'){
      return a;
    } else if (language=='हिन्दी'){
      return days_hin[days_eng.indexOf(a)];
    } else if (language=='Français'){
      return days_fra[days_eng.indexOf(a)];
    } else if (language=='한국어'){
      return days_kor[days_eng.indexOf(a)];
    } else {
      return days_ben[days_eng.indexOf(a)];
    }
  }

  List? langmonthlist(){
    if (language=='English'){
      return months_eng;
    } else if (language=='हिन्दी'){
      return months_hin;
    } else if (language=='Français'){
      return months_fra;
    } else if (language=='한국어'){
      return months_kor;
    } else {
      return months_ben;
    }
  }

  List? langlist(){
    if (language=='English'){
      return home_eng;
    } else if (language=='हिन्दी'){
      return home_hin;
    } else if (language=='Français'){
      return home_fra;
    } else if (language=='한국어'){
      return home_kor;
    } else {
      return home_ben;
    }
  }

  List? aboutlanglist(){
    if (language=='English'){
      return about_eng;
    } else if (language=='हिन्दी'){
      return about_hin;
    } else if (language=='Français'){
      return about_fra;
    } else if (language=='한국어'){
      return about_kor;
    } else {
      return about_ben;
    }
  }

  Color? accentpicker(){
    return accentcolor[color_pallette.indexOf(color)];
  }

  Color? themepicker(){
    if (theme==true){
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color? fontpicker(){
    if (theme==true){
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  Color? subfontpicker(){
    if (theme==true){
      return Colors.grey[600];
    } else {
      return Colors.grey[400];
    }
  }

  Color? subsubfontpicker(){
    if (theme==true){
      return Colors.white;
    } else {
      return Colors.grey[900];
    }
  }

  List? home_lang(){
    if (language=='English'){
      return home_eng;
    } else if (language=='Hindi'){
      return home_hin;
    } else if (language=='Français'){
      return home_fra;
    } else if (language=='한국어'){
      return home_kor;
    } else {
      return home_ben;
    }
  }

}