class EV {
  int id;
  String firstName;
  String lastname;
  int Gelir;
  int Su;
  int Elektrik;
  int DogalGaz;
  int Mutfak;
  int Diger;
  String Status;

  EV(String firstName, String lastName, int gelir, int su, int elektrik, int dogalgaz, int mutfak, int diger) {
    this.firstName = firstName;
    this.lastname = lastName;
    this.Gelir = gelir;
    this.Su = su;
    this.Elektrik = elektrik;
    this.DogalGaz = dogalgaz;
    this.Mutfak = mutfak;
    this.Diger = diger;
  }

  EV.evId(int id, String firstName, String lastName,  int gelir, int su, int elektrik, int dogalgaz, int mutfak, int diger) {
    this.id = id;
    this.firstName = firstName;
    this.lastname = lastName;
    this.Gelir = gelir;
    this.Su = su;
    this.Elektrik = elektrik;
    this.DogalGaz = dogalgaz;
    this.Mutfak = mutfak;
    this.Diger = diger;
  }

  String get getEvStatus {

    int toplam = this.Su + this.Elektrik + this.DogalGaz + this.Mutfak + this.Diger;
    int Kar = this.Gelir - toplam;
    String sonuc = "";
    if (Kar >5000) {
      sonuc = "Net kar = $Kar";
    } else if (Kar > 1400) {
      sonuc = "Ortalama bütçe";
    } else {
      sonuc = "Kötü bütçe!";
    }
    return sonuc;
  }



}
