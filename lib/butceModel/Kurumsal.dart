class Kurumsal {
  int Stokid;
  String StokAdi;
  String StokKod;
  int StokAdet;
  int Borclar;
  int Kira;
  int Gelirler;
  int PersonelMaaslari;
  String StokDurumMesaji;

  Kurumsal(String stokadi, String stokkod, int stokadet ,int borclar , int kira, int gelirler, int personelMaas)
  {
    this.StokAdi = stokadi;
    this.StokKod = stokkod;
    this.StokAdet= stokadet;
    this.Borclar= borclar;
    this.Kira= kira;
    this.Gelirler= gelirler;
    this.PersonelMaaslari= personelMaas;
  }
  Kurumsal.kurumsalId(int stokid, String stokadi, String stokkod, int stokadet ,int borclar , int kira, int gelirler, int personelMaas) {
    this.Stokid = stokid;
    this.StokAdi = stokadi;
    this.StokKod = stokkod;
    this.StokAdet= stokadet;
    this.Borclar= borclar;
    this.Kira= kira;
    this.Gelirler= gelirler;
    this.PersonelMaaslari= personelMaas;
  }

  String get getStokStatus {
    String sonuc = "";
    if (this.StokAdet >= 1000) {
      sonuc = "STOKLAR İYİ DURUMDA!";
    } else if (this.StokAdet >= 100) {
      sonuc = "STOKLARI TAKİP ET";
    } else {
      sonuc = "STOK KÖTÜ DURUMDA";
    }
    return sonuc;
  }
}
