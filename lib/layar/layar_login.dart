import 'package:flutter/material.dart';
import '../global_state.dart';

class LayarLogin extends StatefulWidget {
  const LayarLogin({super.key});

  @override
  State<LayarLogin> createState() => _LayarLoginState();
}

class _LayarLoginState extends State<LayarLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerNamaPengguna = TextEditingController();
  final TextEditingController _controllerKataSandi = TextEditingController();

  @override
  void dispose() {
    _controllerNamaPengguna.dispose();
    _controllerKataSandi.dispose();
    super.dispose();
  }

  void _masuk() {
    if (_formKey.currentState!.validate()) {
      String namaPengguna = _controllerNamaPengguna.text.trim();
      String kataSandi = _controllerKataSandi.text.trim();

      // Cek apakah kombinasi nama pengguna dan kata sandi ada di daftar
      bool ditemukan = daftarPengguna.any(
        (pengguna) => pengguna.namaPengguna == namaPengguna && pengguna.kataSandi == kataSandi,
      );

      if (ditemukan) {
        // Simpan nama pengguna yang login
        penggunaYangLogin = namaPengguna;
        // Pindah ke halaman menu
        Navigator.pushReplacementNamed(context, '/menu');
      } else {
        // Tampilkan pesan error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('username or password incorrect!')),
        );
      }
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
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Sign in to continue',
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
                    // Input Nama Pengguna
                    _buildTextField('Ussername', _controllerNamaPengguna, (value) {
                      if (value == null || value.isEmpty) {
                        return 'name cannot be empty';
                      }
                      return null;
                    }),
                    const SizedBox(height: 16),

                    // Input Kata Sandi
                    _buildTextField('Password', _controllerKataSandi, (value) {
                      if (value == null || value.isEmpty) {
                        return 'password cannot be empty';
                      }
                      return null;
                    }, isPassword: true),
                    const SizedBox(height: 24),

                    // Tombol Masuk & Teks Daftar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Tombol Masuk
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: _masuk,
                              child: const Text(
                                'Login',
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
                        // Teks "Belum punya akun? Daftar"
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/daftar');
                          },
                          child: const Text(
                            'Dont have an account? Sign Up',
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
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
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
