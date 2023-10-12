import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';

///method void main ini digunakan untuk menjalankan seluruh widget yang ada di kelas MyApp
void main() => runApp(MyApp());

///Ini adalah kelas MyApp yang merupakan StatefulWidget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///Mengembalikan objek MateralApp yang digunakan untuk membungkus beberapa widget yang dapat menerapkan style material design

    return MaterialApp(
      ///title digunakan untuk menampilkan teks 'Formulir Daur Ulang Sampah'

      title:
          'Formulir Daur Ulang Sampah', ///Widget ThemeData ini digunakan untuk menetapkan tema aplikasi menggunakan Material Design
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      ///Menetapkan halaman awal aplikasi sebagai Ho
      home: HomePage(),
    );
  }
}

///Ini adalah kelas HomePage yang merupakan StatefulWidget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  ///Method ini mengembalikan objek _HomePageState
  @override
  State<HomePage> createState() => _HomePageState();
}

///Ini adalah kelas _HomePageState yang merupakan turunan dari State<HomePage>
class _HomePageState extends State<HomePage> {
  ///Membuat objek UserController menggunakan Get.find()
  UserController userController = Get.find();
  ///Membuat GlobalKey dengan tipe FormBuilderState
  final _formKey = GlobalKey<FormBuilderState>();
  ///Mendeklarasikan variabel _name, _alamat, _nohp, _jenis, _jumlah, dan _tanggal
  String _name = '';
  String _alamat = '';
  String _nohp = '';
  String _jenis = '';
  String _jumlah = '';
  String _tanggal = '';

  ///Method ini tidak memiliki implementasi, sehingga mengembalikan null
  get FormBuilderValidators => null;

  ///Method build() yang mengembalikan objek Scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ///backgroundColor ini digunakan untuk memberi warna biru pada background
        backgroundColor: Colors.blue[50],
        ///Widget Center digunakan untuk mengatur posisi agar teks berada di tengah
        title: (const Center(
          ///Widget Text ini digunakan untuk menampilkan teks "Formulir Daur Ulang Sampah" 
          ///dengan warna bluegrey dan ukuran font 20
          child: Text(
            "Formulir Daur Ulang Sampah",
            style: TextStyle(fontSize: 20, color: Colors.blueGrey),
          ),
        )),
        actions: [
          IconButton(
              ///memberi warna blueGrey pada button
              color: Colors.blueGrey,
              ///memberi fungsi agar ketika button ditekan, user akan logout atau keluar dari apliksai
              onPressed: () {
                userController.logout();
              },
              ///memberi ikon logout pada button
              icon: Icon(Icons.logout))
        ],
      ),
      ///Widget Padding untuk menambahkan padding pada child widget
      body: Padding(
        ///Menetapkan jarak padding sebesar 16.0 pada setiap sisinya
        padding: EdgeInsets.all(16.0),
        ///Widget FormBuilder yang berisi form
        child: FormBuilder(
          ///Menetapkan kunci GlobalKey<FormBuilderState> untuk form
          key: _formKey,
          ///Menetapkan nilai awal pada form
          initialValue: {
            'date': DateTime.now(),
            'accept_terms': false,
          },
          /// Menetapkan mode validasi otomatis pada saat interaksi pengguna
          autovalidateMode: AutovalidateMode.onUserInteraction,
          /// Widget Column sebagai container untuk semua form fields
          child: Column(
            children: <Widget>[
              /// Widget Container untuk menampilkan logo dengan panjang dan lebar 100
              Container(
                  width: 100,
                  height: 100,
                  child: Image.asset("images/assets/logo.png")),
              /// Widget FormBuilderTextField digunakan untuk input nama
              FormBuilderTextField(
                name: 'nama',
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Nama'),
                validator: FormBuilderValidators?.required(),
                onSaved: (value) => _name = value!,
              ),
              /// Widget SizedBox untuk menambahkan jarak antar form fields
              SizedBox(
                height: 10,
              ),
              /// Widget FormBuilderTextField untuk input alamat
              FormBuilderTextField(
                name: 'alamat',
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Alamat'),
                validator: FormBuilderValidators?.required(),
                onSaved: (value) => _alamat = value!,
              ),
              /// Widget SizedBox untuk menambahkan jarak antar form fields
              SizedBox(
                height: 10,
              ),
              /// Widget FormBuilderTextField untuk input nomor telepon
              FormBuilderTextField(
                name: 'nohp',
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'No. Hp Yang Bisa Dihubungi !'),
                validator: FormBuilderValidators?.numeric(),
                onSaved: (value) => _nohp = value!,
              ),
              /// Widget SizedBox untuk menambahkan jarak antar form fields
              SizedBox(
                height: 10,
              ),
              /// Widget FormBuilderDropdown digunakan untuk menampilkan dropdown pada form
              FormBuilderDropdown(
                /// name digunakan untuk menyimpan nilai pada field yang dipilih
                name: 'jenis_sampah',
                /// decoration digunakan untuk menentukan tampilan dari field, seperti border dan label
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: ''),
                /// hint digunakan untuk menampilkan hint atau pesan pada dropdown
                hint: Text('Pilih Jenis Sampah'),
                /// items berisi pilihan yang akan ditampilkan pada dropdown
                items: [
                  'Plastik',
                  'Kertas',
                  'Besi',
                  'Kaca',
                  'Campuran',
                ] /// map digunakan untuk mengubah setiap nilai pada items menjadi DropdownMenuItem
                    .map((jenis) => DropdownMenuItem(
                          value: jenis,
                          child: Text('$jenis'),
                        ))
                    .toList(),
                /// map digunakan untuk mengubah setiap nilai pada items menjadi DropdownMenuItem
                validator: FormBuilderValidators?.required(),
                /// onSaved digunakan untuk menyimpan nilai yang dipilih pada field
                onSaved: (value) => _jenis = value!,
              ),
              /// Widget SizedBox untuk menambahkan jarak antar form fields
              SizedBox(
                height: 10,
              ),
              /// Widget FormBuilderDropdown untuk membuat dropdown form field dengan label 'jumlah_sampah'
              FormBuilderDropdown(
                /// nama variabel yang akan digunakan untuk menyimpan value
                name: 'jumlah_sampah',
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: ''),
                /// hint digunakan untuk menampilkan hint atau pesan pada dropdown
                hint: Text(
                    'Pilih Jumlah Sampah (batas maksimal pengankutan 10kg!)'),
                /// items berisi pilihan yang akan ditampilkan pada dropdown
                items: [
                  '1',
                  '2',
                  '3',
                  '4',
                  '5',
                  '6',
                  '7',
                  '8',
                  '9',
                  '10',
                ]
                    /// map digunakan untuk mengubah setiap nilai pada items menjadi DropdownMenuItem
                    .map((jenis) => DropdownMenuItem(
                          value:
                              jenis, /// nilai yang akan disimpan jika pilihan ini dipilih
                          child: Text(
                              '$jenis'), /// teks yang akan ditampilkan untuk pilihan ini
                        ))
                    .toList(), /// mengubah daftar pilihan menjadi list
                validator: FormBuilderValidators
                    ?.required(), /// validator untuk memastikan form field diisi
                onSaved: (value) => _jumlah = value!,
              ),
              /// Widget SizedBox untuk menambahkan jarak antar form fields
              SizedBox(
                height: 10,
              ),
              /// Widget FormBuilderDateTimePicker untuk membuat date picker form field dengan label 'tanggal'
              FormBuilderDateTimePicker(
                name:
                    'tanggal', /// nama variabel yang akan digunakan untuk menyimpan value
                inputType: InputType.date,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    fillColor: Colors.white,
                    filled: true,
                    labelText:
                        'Tanggal Pengangkutan'), /// label untuk form field
                onSaved: (value) => _tanggal = value
                    .toString(), /// fungsi untuk menyimpan value ke variabel _tanggal dan mengkonfersinya ke string
              ),
              /// Widget SizedBox untuk menambahkan jarak antar form fields
              SizedBox(
                height: 10,
              ),
              /// Widget FormBuilderCheckbox digunakan untuk menampilkan pilihan checkbox
              FormBuilderCheckbox(
                name: 'accept_terms',
                ///title digunakan untuk menampilkan teks "Saya menyetujui syarat dan ketentuan yang berlak
                title:
                    Text('Saya menyetujui syarat dan ketentuan yang berlaku'),
                ///validator digunakan untuk memastikan checkbox telah dicentang
                validator: FormBuilderValidators?.requiredTrue(
                    errorText: 'Anda harus menyetujui syarat dan ketentuan'),
              ),
              /// Widget ElevatedButton digunakan untuk menampilkan tombol Submit
              ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    /// menampilkan hasil pengisian form dalam AlertDialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            ///title ini digunakan untuk menampilkan teks "Hasil Pengisian Formulir"
                            title: (const Center(
                              child: Text("Hasil Pengisian Formulir"),
                            )),
                            content: Container(
                              width: double.maxFinite,
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ///Widget ListTile ini digunakan untuk menampilkan nama sesuai dengan data yang telah diinput user
                                      ListTile(
                                        title: Text(
                                          "Nama :",
                                        ),
                                        subtitle: Text(
                                          "$_name",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blueGrey),
                                        ),
                                      ),
                                      ///Widget ListTile ini digunakan untuk menampilkan alamat sesuai dengan data yang telah diinput user
                                      ListTile(
                                        title: Text("Alamat :"),
                                        subtitle: Text(
                                          "$_alamat",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blueGrey),
                                        ),
                                      ),
                                      ///Widget ListTile ini digunakan untuk menampilkan no telpon sesuai dengan data yang telah diinput user
                                      ListTile(
                                        title: Text("No. HP :"),
                                        subtitle: Text(
                                          "$_nohp",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blueGrey),
                                        ),
                                      ),
                                      ///Widget ListTile ini digunakan untuk menampilkan jenis sampah sesuai dengan data yang telah diinput user
                                      ListTile(
                                        title: Text("Jenis Sampah :"),
                                        subtitle: Text(
                                          "$_jenis",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blueGrey),
                                        ),
                                      ),
                                      ///Widget ListTile ini digunakan untuk menampilkan jumlah sampah sesuai dengan data yang telah diinput user
                                      ListTile(
                                        title: Text("Jumlah Sampah :"),
                                        subtitle: Text(
                                          "$_jumlah kg",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blueGrey),
                                        ),
                                      ),
                                      ///Widget ListTile ini digunakan untuk menampilkan tanggal pengangkutan sampah
                                      ListTile(
                                        title: Text("Tanggal :"),
                                        subtitle: Text(
                                          "$_tanggal",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blueGrey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            /// Tombol Close digunakan untuk menutup dialog dan kembali ke halaman sebelumnya
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Close"),
                              ),
                            ]);
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
