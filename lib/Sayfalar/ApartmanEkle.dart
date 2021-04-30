import 'package:flutter/material.dart';
import 'package:butcevestokuygulamam/butceModel/Apartman.dart';

class ApartmanEkle extends StatefulWidget {
  List<Apartman> apartman;

  ApartmanEkle(this.apartman);

  @override
  State<StatefulWidget> createState() {
    return _ApartmanEkleState();
  }
}

class _ApartmanEkleState extends State<ApartmanEkle> {
  var formApartmanAnahtari = GlobalKey<FormState>();
  Apartman apartmanEkle = Apartman.apartmanID(0, "", "", 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Apartman bütçesi Ekle!"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Form(
            key: formApartmanAnahtari,
            child: Column(
              children: <Widget>[
                apartmanid(),
                apartmanAdiOlustur(),
                apartmankodOlustur(),
                apartmanGiderleri(),
                apartmanTemizlik(),
                apartmanGuvenlik(),
                apartmanAidat(),
                stokkaydetButon(),
              ],
            ),
          ),
        ));
  }

  Widget apartmanid() {
    return TextFormField(
      decoration: InputDecoration(labelText: "ID giriniz!", hintText: "2"),
      onSaved: (String value) {
        apartmanEkle.Apartmanid = int.parse(value);
      },
    );
  }

  Widget apartmanAdiOlustur() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Apartman Adı!", hintText: "Yıldız Apt."),
      onSaved: (String value) {
        apartmanEkle.ApartmanAdi = value;
      },
    );
  }

  Widget apartmankodOlustur() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Apartman Dış Kapı Numarası!", hintText: "57"),
      onSaved: (String value) {
        apartmanEkle.ApartmanKod = value;
      },
    );
  }

  Widget apartmanGiderleri() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Giderler!", hintText: "500"),
      onSaved: (String value) {
        apartmanEkle.ApartmanGiderleri = int.parse(value);
      },
    );
  }

  Widget apartmanTemizlik() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Temizlik giderleri!", hintText: "500"),
      onSaved: (String value) {
        apartmanEkle.ApartmanTemizlik = int.parse(value);
      },
    );
  }

  Widget apartmanGuvenlik() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Apartman Güvenlik gideri!", hintText: "2500"),
      onSaved: (String value) {
        apartmanEkle.ApartmanGuvenlik = int.parse(value);
      },
    );
  }

  Widget apartmanAidat() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aidat geliri!", hintText: "1500"),
      onSaved: (String value) {
        apartmanEkle.ApartmanAidat = int.parse(value);
      },
    );
  }

  Widget stokkaydetButon() {
    return RaisedButton(
      child: Text("Bilgileri Kaydet"),
      onPressed: () {
        formApartmanAnahtari.currentState.save();
        widget.apartman.add(apartmanEkle);
        Navigator.pop(context);
      },
    );
  }
}
