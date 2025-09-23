import 'package:flutter/material.dart';
import '../models/pengguna.dart';
import '../global_state.dart';

class LayarRegister extends StatefulWidget {
  const LayarRegister({super.key});

  @override
  State<LayarRegister> createState() => _LayarRegisterState();
}

class _LayarRegisterState extends State<LayarRegister> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerNamaLengkap = TextEditingController();
  final TextEditingController _controllerNamaPengguna = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerKataSandi = TextEditingController();

  @override
  void dispose() {
    _controllerNamaLengkap.dispose();
    _controllerNamaPengguna.dispose();
    _controllerEmail.dispose();
    _controllerKataSandi.dispose();
    super.dispose();
  }

  void _daftar() {
    if (_formKey.currentState!.validate()) {
      // Buat objek pengguna baru
      Pengguna penggunaBaru = Pengguna(
        namaLengkap: _controllerNamaLengkap.text.trim(),
        namaPengguna: _controllerNamaPengguna.text.trim(),
        email: _controllerEmail.text.trim(),
        kataSandi: _controllerKataSandi.text.trim(),
      );

      // Simpan ke daftar global
      daftarPengguna.add(penggunaBaru);

      // Tampilkan pesan sukses
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pendaftaran berhasil! Silakan masuk.')),
      );

      // Pindah ke halaman login
      Navigator.pushReplacementNamed(context, '/masuk');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              // Logo Tas Belanja
              const Icon(
                Icons.shopping_bag,
                size: 60,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),

              // Judul
              const Text(
                'Buat Akun',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Bergabung bersama kami hari ini!',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 40),

              // Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Input Nama Lengkap
                    _buildTextField('Nama Lengkap', _controllerNamaLengkap, (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama lengkap wajib diisi';
                      }
                      return null;
                    }),
                    const SizedBox(height: 16),

                    // Input Nama Pengguna
                    _buildTextField('Nama Pengguna', _controllerNamaPengguna, (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama pengguna wajib diisi';
                      }
                      return null;
                    }),
                    const SizedBox(height: 16),

                    // Input Email
                    _buildTextField('Email', _controllerEmail, (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email wajib diisi';
                      }
                      if (!value.contains('@')) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    }, isEmail: true),
                    const SizedBox(height: 16),

                    // Input Kata Sandi
                    _buildTextField('Kata Sandi', _controllerKataSandi, (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kata sandi wajib diisi';
                      }
                      if (value.length < 6) {
                        return 'Kata sandi minimal 6 karakter';
                      }
                      return null;
                    }, isPassword: true),
                    const SizedBox(height: 16),

                    // Tombol Daftar & Teks Masuk
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Tombol Daftar
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: _daftar,
                              child: const Text(
                                'Daftar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Teks "Sudah punya akun? Masuk"
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/masuk');
                          },
                          child: const Text(
                            'Sudah punya akun? Masuk',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hint,
    TextEditingController controller,
    String? Function(String?) validator, {
    bool isPassword = false,
    bool isEmail = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
        validator: validator,
      ),
    );
  }
}