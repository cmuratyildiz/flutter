import 'package:butcevestokuygulamam/Sayfalar/hakkimizda.dart';
import 'package:flutter/material.dart';
import 'package:butcevestokuygulamam/Sayfalar/AnaSayfa.dart';
import 'kayitOl.dart';
import 'package:google_fonts/google_fonts.dart';

class Giris extends StatefulWidget {
  @override
  _GirisState createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  TextEditingController kullaniciEmail = new TextEditingController();
  TextEditingController kullaniciSifre = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String DurumMesaji = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hoşgeldiniz... Giriş Yapınız!",style: GoogleFonts.davidLibre(),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Center(
                      child: Container(
                          width: 200,
                          height: 150,
                          child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png"))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: kullaniciEmail,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen Email adresinizi giriniz!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email adresinizi giriniz!',
                          hintText: 'yildizc49@gmail.com',
                          icon: Icon(Icons.email)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: TextFormField(
                      controller: kullaniciSifre,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Şifreinizi giriniz!';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Şifreniz',
                          hintText: '123123',
                          icon: Icon(Icons.lock_clock)),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      var kulEmail = kullaniciEmail.text;
                      var kulSifre = kullaniciSifre.text;
                      setState(() {
                        DurumMesaji =
                            "ßilgileriniz : Email , $kulEmail Şifreniz, $kulSifre";
                      });
                    },
                    child: Text(
                      'Bilgilerimi Göster!',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                  Text("$DurumMesaji"),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnaEkran()));
                        }
                      },
                      child: Text(
                        'Giriş yap!',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 130,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => KayitOl()));
                    },
                    child: Text(
                      'Yeni kayıt oluştur!',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Hakkimizda()));
                    },
                    child: Text(
                      'Hakkımızda',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
