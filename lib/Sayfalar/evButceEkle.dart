import 'package:flutter/material.dart';
import 'package:butcevestokuygulamam/butceModel/Ev.dart';

class EvbutceEkle extends StatefulWidget {
  List<EV> evbutceleri;

  EvbutceEkle(this.evbutceleri);

  @override
  State<StatefulWidget> createState() {
    return _EvbutceEkle();
  }
}

class _EvbutceEkle extends State<EvbutceEkle> {
  final gelirController = TextEditingController();
  final suController = TextEditingController();
  final elektrikController = TextEditingController();
  final dogalgazController = TextEditingController();
  final mutfakController = TextEditingController();
  final digerController = TextEditingController();

  String Toplam = "";
  var formAnahtari = GlobalKey<FormState>();
  EV evbutce = EV("", "", 0, 0, 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Ev bütçeni oluştur !"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Form(
            key: formAnahtari,
            child: Column(
              children: <Widget>[
                evid(),
                isimOlustur(),
                soyadOlustur(),
                Gelir(),
                Su(),
                Elektrik(),
                DogalGaz(),
                Mutfak(),
                Diger(),
                Text("toplam : $Toplam",),
                kaydetButon(),
              ],
            ),
          ),
        ));
  }

  Widget evid() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "ID giriniz!", hintText: "2"),
      onSaved: (String value) {
        evbutce.id = int.parse(value);
      },
    );
  }

  Widget isimOlustur() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Bina Adını Giriniz!", hintText: "Bina İsmi!"),
      onSaved: (String value) {
        evbutce.firstName = value;
      },
    );
  }

  Widget soyadOlustur() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Soyadınız!", hintText: "Soyadınız"),
      onSaved: (String value) {
        evbutce.lastname = value;
      },
    );
  }

  Widget Gelir() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Gelir toplamı!", hintText: "1000"),
      onSaved: (String value) {
        evbutce.Gelir = int.parse(value);
      },
    );
  }

  Widget Su() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Aylık su faturanız!",
          hintText: "Su Faturası : örnek 100"),
      onSaved: (String value) {
        evbutce.Su = int.parse(value);
      },
    );
  }

  Widget Elektrik() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Aylık Elektrik Faturanız!",
          hintText: "Elektrik Faturası : örnek 100"),
      onSaved: (String value) {
        evbutce.Elektrik = int.parse(value);
      },
    );
  }

  Widget DogalGaz() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Aylık Doğalgaz faturası!",
          hintText: "Doğalgaz Faturası : örnek 100"),
      onSaved: (String value) {
        evbutce.DogalGaz = int.parse(value);
      },
    );
  }

  Widget Mutfak() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Mutfak masraflarınız!",
          hintText: "Mutfak masraflarınız : örnek 100"),
      onSaved: (String value) {
        evbutce.Mutfak = int.parse(value);
      },
    );
  }

  Widget Diger() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Diğer Giderleriniz!",
          hintText: "Diğer ödemeler : örnek 100"),
      onSaved: (String value) {
        evbutce.Diger = int.parse(value);
      },
    );
  }

  Widget kaydetButon() {
    return RaisedButton(
      child: Text("Bilgileri Kaydet"),
      onPressed: () {
        formAnahtari.currentState.save();
        widget.evbutceleri.add(evbutce);
        Navigator.pop(context);
      },
    );
  }

  void karHesapla() {
    if (formAnahtari.currentState.validate()) {
      int gelir = int.parse(gelirController.text);
      int su = int.parse(suController.text);
      int elektrik = int.parse(elektrikController.text);
      int gaz = int.parse(dogalgazController.text);
      int mutfak = int.parse(mutfakController.text);
      int diger = int.parse(digerController.text);

      int sonuc = su + elektrik + gaz + mutfak + diger;

      setState(() {
        Toplam = " Aylık masrafların toplamı : $sonuc";
      });
    }
  }
}
