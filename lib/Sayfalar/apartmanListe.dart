import 'package:flutter/material.dart';
import 'package:butcevestokuygulamam/Sayfalar/ApartmanEkle.dart';
import 'package:butcevestokuygulamam/butceModel/Apartman.dart';
import '../Listeler/ApartmanListesi.dart';
import 'package:google_fonts/google_fonts.dart';

class ApartmanEkrani extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ApartmanEkraniState();
  }
}

class _ApartmanEkraniState extends State {
  Apartman seciliApartman = Apartman.apartmanID(0, "", "", 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "APARTMAN BÜTÇE LİSTEM",
          style: GoogleFonts.davidLibre(),
        ),
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ApartmanEkle(apartman)),
          ).then((value) => setState(() {}));
        },
        label: const Text('apartman bütçesi'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: apartman.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(apartman[index].ApartmanAdi +
                      " " +
                      apartman[index].ApartmanKod),
                  subtitle: Text("Aidat durumu :" +
                      apartman[index].ApartmanAidat.toString() +
                      "₺" +
                      "Gider durumu :" +
                      apartman[index].ApartmanGiderleri.toString()),
                  leading: CircleAvatar(
                    child: Text(apartman[index].Apartmanid.toString()),
                  ),
                  onTap: () {
                    setState(() {
                      this.seciliApartman = apartman[index];
                    });
                  },
                );
              }),
        ),
        Align(
          alignment: Alignment(-1.0, 1.0),
          child: OutlinedButton.icon(
            icon: Icon(Icons.star_outline),
            label: Text(
                seciliApartman.ApartmanAdi + " " + seciliApartman.ApartmanKod),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10.0),
              side: BorderSide(width: 2.0, color: Colors.blue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
