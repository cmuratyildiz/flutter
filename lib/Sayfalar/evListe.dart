import 'package:flutter/material.dart';
import 'package:butcevestokuygulamam/Sayfalar/evButceEkle.dart';
import 'package:butcevestokuygulamam/butceModel/Ev.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Listeler/EvListesi.dart';

class EvEkrani extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EvEkraniState();
  }
}

class _EvEkraniState extends State {
  EV seciliEvButcesi = EV.evId(0, "", "", 0, 0, 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "EV BÜTÇE LİSTEM",
          style: GoogleFonts.davidLibre(),
        ),
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EvbutceEkle(evbutceleri)),
          ).then((value) => setState(() {}));
        },
        label: const Text('Yeni bütçe ekle'),
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
              itemCount: evbutceleri.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(evbutceleri[index].firstName +
                      " " +
                      evbutceleri[index].Gelir.toString()),
                  subtitle: Text("Gelir durumu :" +
                      evbutceleri[index].Gelir.toString() +
                      "₺" +
                      "Gider durumu :" +
                      evbutceleri[index].Diger.toString() +
                      "₺"),
                  leading: CircleAvatar(
                    child: Text(evbutceleri[index].id.toString()),
                  ),
                  onTap: () {
                    setState(() {
                      this.seciliEvButcesi = evbutceleri[index];
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
                seciliEvButcesi.firstName + " " + seciliEvButcesi.lastname),
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
