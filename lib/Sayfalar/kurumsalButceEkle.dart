import 'package:flutter/material.dart';
import 'package:butcevestokuygulamam/butceModel/Kurumsal.dart';
import 'package:google_fonts/google_fonts.dart';

class KurumsalButceEkle extends StatefulWidget {
  List<Kurumsal> kurumsalButceler;

  KurumsalButceEkle(this.kurumsalButceler);

  @override
  State<StatefulWidget> createState() {
    return _KurumsalButceEkle();
  }
}

class _KurumsalButceEkle extends State<KurumsalButceEkle> {
  var formKurumsalAnahtar = GlobalKey<FormState>();
  Kurumsal kurumsalEkle = Kurumsal.kurumsalId(0,"", "", 0,0,0,0,0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("İşletme bütçesi ekle!"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: formKurumsalAnahtar,
            child: Column(
              children: <Widget>[
                stokid(),
                stokAdiOlustur(),
                stokkodOlustur(),
                stokAdet(),
                borclar(),
                kira(),
                gelirler(),
                personelMaaslari(),
                stokkaydetButon(),
              ],
            ),
          ),
        )
    );
  }

  Widget stokid() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "ID giriniz!", hintText: "2"),
      onSaved: (String value) {
        kurumsalEkle.Stokid = int.parse(value);
      },
    );
  }
  Widget stokAdiOlustur() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Stok adını giriniz!", hintText: "Dükkan stok"),
      onSaved: (String value) {
        kurumsalEkle.StokAdi = value;
      },
    );
  }

  Widget stokkodOlustur() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Stok kodunuz!", hintText: "KOD01"),
      onSaved: (String value) {
        kurumsalEkle.StokKod = value;
      },
    );
  }

  Widget stokAdet() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Stok adet Değeri Giriniz!", hintText: "1000"
      ),
      onSaved: (String value) {
        kurumsalEkle.StokAdet = int.parse(value);
      },
    );
  }
  Widget borclar() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Borç Toplamı Giriniz!", hintText: "2000"
      ),
      onSaved: (String value) {
        kurumsalEkle.Borclar = int.parse(value);
      },
    );
  }
  Widget kira() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Kira!", hintText: "3500"
      ),
      onSaved: (String value) {
        kurumsalEkle.Kira = int.parse(value);
      },
    );
  }
  Widget gelirler() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Gelir toplamı Giriniz!", hintText: "10000"
      ),
      onSaved: (String value) {
        kurumsalEkle.Gelirler = int.parse(value);
      },
    );
  }
  Widget personelMaaslari() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Personel maaş toplamı Giriniz!", hintText: "5000"
      ),
      onSaved: (String value) {
        kurumsalEkle.PersonelMaaslari = int.parse(value);
      },
    );
  }

  Widget stokkaydetButon() {
    return RaisedButton(
      child: Text("Kurumsal Bütçeyi Bilgilerini Kaydet"),
      onPressed: () {
        formKurumsalAnahtar.currentState.save();
        widget.kurumsalButceler.add(kurumsalEkle);
        Navigator.pop(context);
      },
    );
  }
}
