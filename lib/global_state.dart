import 'package:flutter/material.dart';
import 'models/pengguna.dart';

// --- VARIABEL GLOBAL ---
// Daftar pengguna yang sudah mendaftar
List<Pengguna> daftarPengguna = [];

// Nama pengguna yang sedang login
String? penggunaYangLogin;

// Daftar pesanan: Nama Item -> Jumlah
Map<String, int> pesanan = {
  'Nasi Goreng': 0,
  'Mie Goreng': 0,
  'Ayam Bakar': 0,
  'Es Teh': 0,
  'Kopi': 0,
  'Jus Jeruk': 0,
};

// Daftar harga: Nama Item -> Harga Satuan
Map<String, int> hargaItem = {
  'Nasi Goreng': 25000,
  'Mie Goreng': 20000,
  'Ayam Bakar': 30000,
  'Es Teh': 5000,
  'Kopi': 10000,
  'Jus Jeruk': 15000,
};
// --- AKHIR VARIABEL GLOBAL ---