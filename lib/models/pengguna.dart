// Model untuk menyimpan data pengguna yang mendaftar
class Pengguna {
  final String namaLengkap;
  final String namaPengguna;
  final String email;
  final String kataSandi;

  Pengguna({
    required this.namaLengkap,
    required this.namaPengguna,
    required this.email,
    required this.kataSandi,
  });
}