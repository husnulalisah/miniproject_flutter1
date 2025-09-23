import 'package:flutter/material.dart';
import '../global_state.dart';

class LayarTransaksi extends StatelessWidget {
  const LayarTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    // Filter item yang jumlahnya > 0
    final items = pesanan.entries.where((e) => e.value > 0).toList();

    // Hitung total keseluruhan
    int totalKeseluruhan = items.fold(0, (sum, e) => sum + (e.value * hargaItem[e.key]!));

    return Scaffold(
      appBar: AppBar(
        title: const Text("TOTAL"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Daftar Item yang Dipesan
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final namaItem = items[index].key;
                final jumlah = items[index].value;
                final hargaSatuan = hargaItem[namaItem]!;
                final totalPerItem = jumlah * hargaSatuan;

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text('$jumlah x $namaItem'),
                    subtitle: Text('Rp $totalPerItem'),
                    trailing: Text('Rp $hargaSatuan'),
                  ),
                );
              },
            ),
          ),
          // Tampilkan Total Keseluruhan
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Keseluruhan: Rp $totalKeseluruhan',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          // Tombol Bayar dan Batal
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                // Tombol Batal
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Reset semua pesanan
                      pesanan.updateAll((key, value) => 0);
                      // Kembali ke menu
                      Navigator.pushReplacementNamed(context, '/menu');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Batal',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Tombol Bayar
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Reset semua pesanan
                      pesanan.updateAll((key, value) => 0);
                      // Tampilkan dialog sukses
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Pembayaran Berhasil!'),
                          content: const Text('Terima kasih atas pesanan Anda.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(ctx, '/menu');
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Bayar',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}