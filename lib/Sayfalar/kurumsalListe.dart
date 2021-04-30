import 'package:flutter/material.dart';
import 'package:butcevestokuygulamam/Sayfalar/kurumsalButceEkle.dart';
import 'package:butcevestokuygulamam/butceModel/Kurumsal.dart';
import '../Listeler/KurumsalListe.dart';
import 'package:google_fonts/google_fonts.dart';

class KurumsalEkran extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KurumsalEkranState();
  }
}

class _KurumsalEkranState extends State {
  Kurumsal seciliStok = Kurumsal.kurumsalId(0, "", "", 0,0,0,0,0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "İŞLETME LİSTEM",
          style: GoogleFonts.davidLibre(),
        ),
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KurumsalButceEkle(kurumsalButceler)),
          ).then((value) => setState(() {}));
        },
        label: const Text('Kurumsal bütçe ekle'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }

  var isim = "Çağatay Murat YILDIZ";
  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: kurumsalButceler.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      kurumsalButceler[index].StokAdi + " " + kurumsalButceler[index].StokKod),
                  subtitle: Text("Stok adeti :" +
                      kurumsalButceler[index].StokAdet.toString() +
                      "[" +
                      kurumsalButceler[index].getStokStatus +
                      "]"),
                  leading: CircleAvatar(
                    child: Text(kurumsalButceler[index].Stokid.toString()),
                  ),
                  onTap: () {
                    setState(() {
                      this.seciliStok = kurumsalButceler[index];
                    });
                  },
                );
              }),
        ),
        Align(
          alignment: Alignment(-1.0, 1.0),
          child: OutlinedButton.icon(
            icon: Icon(Icons.star_outline),
            label: Text(seciliStok.StokAdi + " " + seciliStok.StokKod),
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
