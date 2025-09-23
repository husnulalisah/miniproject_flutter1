import 'package:flutter/material.dart';
import '../global_state.dart';

class LayarMenu extends StatefulWidget {
  const LayarMenu({super.key});

  @override
  State<LayarMenu> createState() => _LayarMenuState();
}

class _LayarMenuState extends State<LayarMenu> {
  // Daftar menu makanan dan minuman
  final List<Map<String, dynamic>> daftarMenu = [
    {'nama': 'Nasi Goreng', 'harga': 25000, 'ikon': Icons.rice_bowl},
    {'nama': 'Mie Goreng', 'harga': 20000, 'ikon': Icons.ramen_dining}, // changed
    {'nama': 'Ayam Bakar', 'harga': 30000, 'ikon': Icons.outdoor_grill}, // changed
    {'nama': 'Es Teh', 'harga': 5000, 'ikon': Icons.local_drink},
    {'nama': 'Kopi', 'harga': 10000, 'ikon': Icons.coffee},
    {'nama': 'Jus Jeruk', 'harga': 15000, 'ikon': Icons.local_drink_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Daftar Item Menu
          Expanded(
            child: ListView.builder(
              itemCount: daftarMenu.length,
              itemBuilder: (context, index) {
                final item = daftarMenu[index];
                final namaItem = item['nama'] as String;
                final ikonItem = item['ikon'] as IconData;

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(ikonItem, size: 40),
                    title: Text(namaItem),
                    subtitle: Text('Rp ${item['harga']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Tombol Kurang
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          color: Colors.red,
                          onPressed: () {
                            setState(() {
                              if (pesanan[namaItem]! > 0) {
                                pesanan[namaItem] = pesanan[namaItem]! - 1;
                              }
                            });
                          },
                        ),
                        // Jumlah Pesanan
                        Text(
                          pesanan[namaItem].toString(),
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        // Tombol Tambah
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          color: Colors.green,
                          onPressed: () {
                            setState(() {
                              pesanan[namaItem] = pesanan[namaItem]! + 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Tombol Reset dan Transaksi
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Tombol Reset
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        pesanan.updateAll((key, value) => 0);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Reset',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Tombol Transaksi
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/transaksi');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Transaksi',
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