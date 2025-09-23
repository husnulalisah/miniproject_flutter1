import 'package:flutter/material.dart';
import 'global_state.dart'; // Impor variabel global
import 'layar/layar_login.dart';
import 'layar/layar_register.dart';
import 'layar/layar_menu.dart';
import 'layar/layar_transaksi.dart';

void main() {
  runApp(const AplikasiUtama());
}

class AplikasiUtama extends StatelessWidget {
  const AplikasiUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Pemesanan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      // Mulai dari halaman login
      home: const LayarLogin(),
      routes: {
        '/masuk': (context) => const LayarLogin(),
        '/daftar': (context) => const LayarRegister(),
        '/menu': (context) => const LayarMenu(),
        '/transaksi': (context) => const LayarTransaksi(),
      },
    );
  }
}