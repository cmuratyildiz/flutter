class Apartman {
  int Apartmanid;
  String ApartmanAdi;
  String ApartmanKod;
  int ApartmanGiderleri;
  int ApartmanTemizlik;
  int ApartmanGuvenlik;
  int ApartmanAidat;
  String ApartmanDurumMesaji;

  Apartman(String apartmanAdi, String apartmanKod, int apartmanGiderleri,
      int apartmanTemizlik, int apartmanGuvenlik, int apartmanAidat) {
    this.ApartmanAdi = apartmanAdi;
    this.ApartmanKod = apartmanKod;
    this.ApartmanGiderleri = apartmanGiderleri;
    this.ApartmanTemizlik = apartmanTemizlik;
    this.ApartmanGuvenlik = apartmanGuvenlik;
    this.ApartmanAidat = apartmanAidat;
  }
  Apartman.apartmanID(int apartmanid, String apartmanAdi, String apartmanKod,
      int apartmanGiderleri, int apartmanTemizlik, int apartmanGuvenlik, int apartmanAidat) {
    this.Apartmanid = apartmanid;
    this.ApartmanAdi = apartmanAdi;
    this.ApartmanKod = apartmanKod;
    this.ApartmanGiderleri = apartmanGiderleri;
    this.ApartmanTemizlik = apartmanTemizlik;
    this.ApartmanGuvenlik = apartmanGuvenlik;
    this.ApartmanAidat = apartmanAidat;
  }
}
