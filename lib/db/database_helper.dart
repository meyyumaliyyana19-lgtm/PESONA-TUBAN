import '../models/wisata_model.dart';
import '../models/budaya_model.dart';
import '../models/laporan_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  DatabaseHelper._init();

  // Data Wisata Awal
  final List<Wisata> _wisataList = [
    Wisata(
      id: "1",
      nama: "Goa Akbar",
      lokasi: "Kota Tuban, pusat kota",
      htm: "Rp 10.000",
      jam: "07.00 - 17.00",
      deskripsi:
          "Gua kapur di tengah kota dengan lorong dan ruang-ruang alami yang unik. Menyediakan pemandangan stalaktit dan stalagmit yang memukau serta jalur pejalan kaki yang rapi.",
      gambarPath: "assets/images/goa_akbar.jpg",
      isFavorite: true,
    ),
    Wisata(
      id: "2",
      nama: "Pantai Boom",
      lokasi: "Kelurahan Kingking, Tuban",
      htm: "Rp 5.000",
      jam: "06.00 - 18.00",
      deskripsi:
          "Pantai di bekas pelabuhan lama, cocok untuk menikmati senja dan kuliner laut. Dilengkapi dermaga panjang yang cocok untuk bersua foto dan bersantai.",
      gambarPath: "assets/images/pantai_boom.jpg",
    ),
    Wisata(
      id: "3",
      nama: "Air Terjun Nglirip",
      lokasi: "Singo, Mulyoagung, Singahan, Tuban",
      htm: "Rp 10.000",
      jam: "07.00 - 16.30",
      deskripsi:
          "Air terjun dengan air berwarna hijau tuska yang indah, dikelilingi rindangnya pepohonan dan udara pegunungan yang segar.",
      gambarPath: "assets/images/air_terjun_nglirip.jpg",
    ),
    Wisata(
      id: "4",
      nama: "Makam Sunan Bonang",
      lokasi: "Jalan Kh Mustain, Kutorejo, Kecamatan Tuban, Kutorejo, Kec. Tuban, Kabupaten Tuban, Jawa Timur 62311",
      htm: "free",
      jam: "24 jam",
      deskripsi:
          "Makam Sunan Bonang Tuban berlokasi tak jauh dari Alun-Alun Tuban dan Pantai Boom. Kompleks pemakaman ini didirikan untuk menghormati Sunan Bonang, salah satu wali yang memang selama hidupnya berdakwah di Tuban. Lokasi wisata ziarah selalu ramai kamu. Bahkan, menurut beberapa sumber, lokasi wisata Tuban ini dikunjungi lebih dari satu juta kamu tiap tahunnya.",
      gambarPath: "assets/images/Makam_Sunan_Bonang.jpg",
    ),
    Wisata(
      id: "5",
      nama: "Klenteng Kwan Sing Bio",
      lokasi: "Kutorejo, Tuban, Karangsari, Kutorejo, Kec. Tuban, Kabupaten Tuban, Jawa Timur 62311",
      htm: "free",
      jam: "06.00 - 22.00 WIB.",
      deskripsi:
          "Di sini, kamu juga bisa melihat patung dewa Kwan Sing Tee Koen di bagian belakang klenteng ini. Berdiri gagah dengan tinggi 30 meter, tak heran jika patung ini tercatat dalam Museum Rekor Indonesia (MURI) sebagai salah satu patung tertinggi di Indonesia. Sayang, patung berukuran raksasa ini tiba-tiba runtuh pada 2020 silam, diduga karena faktor cuaca.",
      gambarPath: "assets/images/klenteng.jpg",
    ),
    Wisata(
      id: "6",
      nama: "Pantai Kelapa Tuban",
      lokasi: "Jl. Gresik No.KM, RW.1, Kepoh, Panyuran, Kec. Palang, Kabupaten Tuban, Jawa Timur 62391",
      htm: "Rp 10.000",
      jam: "08.00 - 17.00 WIB.",
      deskripsi:
          "Sesuai dengan namanya, kamu bisa menjumpai banyak pohon kelapa di pantai yang berjarak sekitar 6 km dari pusat kota ini. Nah, kalau kamu gemar foto-foto, berfoto di antara pepohonan kelapa ini harus kamu coba. Bukan itu saja, di pantai ini kamu bisa menjumpai banyak spot foto lain yang tidak kalah bagusnya. Misalnya saja seperti di atas jembatan pantai dengan view langsung ke laut lepas. Selain menikmati pemandangan, kamu bisa juga melakukan banyak aktivitas seru seperti berkuda, naik ATV, flying fox, dan lain-lain.",
      gambarPath: "assets/images/pantai_kelapa.jpg",
    ),
    Wisata(
      id: "7",
      nama: "Pemandian Alam Bektiharjo",
      lokasi: "Desa Bektiharjo, Kecamatan Palang, Kabupaten Tuban, Jawa Timur.",
      htm: "Rp 10.000",
      jam: "08.00 - 17.00",
      deskripsi:
          "Mandi dengan air yang segar dan jernih tengah tengah alam yang indah kedengarannya menyenangkan bukan? Kalau kamu mau merasakan pengalaman tersebut, kunjungi saja Pemandian Alam Bektiharjo. Tempat ini cocok bagi wisatawan yang mencari ketenangan dan relaksasi sambil menikmati kesejukan sumber air alami. Dengan pemandangan yang asri, Bektiharjo juga menjadi tempat yang sempurna untuk berfoto. ",
      gambarPath: "assets/images/kolam_bektiharjo.jpg",
    ),
    Wisata(
      id: "8",
      nama: "Ekowisata Silowo Merakurak",
      lokasi: "Singo, Mulyoagung, Singahan, Tuban",
      htm: "Rp 5.000 - Rp 10.000",
      jam: "08.00 - 15.00",
      deskripsi:
          "kawasan wisata yang mengusung konsep ramah lingkungan dengan berbagai fasilitas edukasi tentang alam. Di sini, kamu dapat menikmati keindahan alam sambil belajar tentang ekosistem lokal yang terjaga. Tempat ini juga menyediakan berbagai aktivitas luar ruangan, seperti trekking dan pengamatan flora dan fauna. ",
      gambarPath: "assets/images/silowo.jpg",
    ),
    Wisata(
      id: "9",
      nama: "Tanazawi Agriculture Edupark & Leisure",
      lokasi: "Desa Tanazawi, Kecamatan Montong, Kabupaten Tuban, Jawa Timur.",
      htm: "Rp 20.000",
      jam: "09.00 - 17.00",
      deskripsi:
          "Air terjun dengan air berwarna hijau tuska yang indah, dikelilingi rindangnya pepohonan dan udara pegunungan yang segar.",
      gambarPath: "assets/images/tanazawi.jpg",
    ),
  ];

  // Data Budaya Awal
  final List<Budaya> _budayaList = [
    Budaya(
      id: "1",
      nama: "Batik Gedog",
      kategori: "Kriya / Kerajinan",
      deskripsi:
          "Batik khas Tuban yang diproses secara manual mulai dari memintal benang, menenun kain (gedog), hingga membatik motif tradisional khas pesisir.",
      gambarPath: "assets/images/batik_gedog.jpg",
      isFavorite: true,
    ),
    Budaya(
      id: "2",
      nama: "Tari Thak-Thakan",
      kategori: "Seni Pertunjukan",
      deskripsi:
          "Tarian rakyat Tuban yang menampilkan sosok tiruan binatang mitologi sebagai perlambang pengusir kejahatan dan pelindung desa.",
      gambarPath: "assets/images/tari_thak_thakan.jpg",
    ),
    Budaya(
      id: "3",
      nama: "Tradisi Sedekah Laut",
      kategori: "Upacara Adat",
      deskripsi:
          "Ritual wujud rasa syukur para nelayan pesisir Tuban atas hasil laut yang melimpah, diwarnai pelarungan sesaji ke tengah laut.",
      gambarPath: "assets/images/sedekah_laut.jpg",
    ),
  ];

  // Data Laporan Awal
  final List<Laporan> _laporanList = [
    Laporan(
      id: "1",
      namaPelapor: "Budi Santoso",
      kategori: "Fasilitas Rusak",
      lokasiWisata: "Goa Akbar",
      deskripsi: "Lampu penerangan di lorong bagian dalam goa redup dan sebagian mati.",
      status: "Diproses",
    ),
    Laporan(
      id: "2",
      namaPelapor: "Siti Aminah",
      kategori: "Kebersihan",
      lokasiWisata: "Pantai Boom",
      deskripsi: "Tempat sampah di area dermaga penuh dan butuh pengangkutan segera.",
      status: "Pending",
    ),
  ];

  // Getter Data
  List<Wisata> getWisata() => _wisataList;
  List<Budaya> getBudaya() => _budayaList;
  List<Laporan> getLaporan() => _laporanList;

  // Toggle Favorit Wisata
  void toggleFavoriteWisata(int index) {
    if (index >= 0 && index < _wisataList.length) {
      _wisataList[index].isFavorite = !_wisataList[index].isFavorite;
    }
  }

  // Toggle Favorit Budaya
  void toggleFavoriteBudaya(int index) {
    if (index >= 0 && index < _budayaList.length) {
      _budayaList[index].isFavorite = !_budayaList[index].isFavorite;
    }
  }

  // Tambah Laporan Pengaduan
  void addLaporan(Laporan laporan) {
    _laporanList.add(laporan);
  }

  // Update Status Laporan oleh Admin
  void updateStatusLaporan(int index, String statusBaru) {
    if (index >= 0 && index < _laporanList.length) {
      _laporanList[index].status = statusBaru;
    }
  }
}