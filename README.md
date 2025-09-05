# ✅ Todo List App  

Aplikasi **Todo List sederhana** yang dibangun dengan **Flutter** menggunakan **Provider** sebagai state management.  

![Flutter](https://img.shields.io/badge/Flutter-Framework-blue?logo=flutter&logoColor=white)  
![Provider](https://img.shields.io/badge/Provider-State%20Management-green)  
![License](https://img.shields.io/badge/License-MIT-lightgrey)  

---

## ✨ Fitur Utama  
- ➕ Tambah todo baru  
- ✅ Tandai todo selesai / belum selesai  
- ✏️ Edit todo yang sudah ada  
- 🗑️ Hapus todo  
- 📜 Lihat **history todo** yang sudah selesai  

---

## 🛠️ Teknologi yang Digunakan  
- [Flutter](https://flutter.dev/) – SDK utama  
- [Provider](https://pub.dev/packages/provider) – State management  
- [Cupertino Icons](https://pub.dev/packages/cupertino_icons) – Set icon iOS  

---

## 📂 Struktur Project  

```bash
lib/
├── main.dart                 # Entry point aplikasi
├── models/
│   └── todo.dart             # Model data Todo
├── providers/
│   └── todo_provider.dart    # State management dengan Provider
├── screens/
│   ├── home_screen.dart      # Layar utama (daftar todo aktif)
│   └── history_screen.dart   # Layar history (todo selesai)
└── widgets/
    └── todo_item.dart        # Custom widget untuk item todo
```

---

## 🌳 Widget Tree  

```text
MaterialApp
└── ChangeNotifierProvider<TodoProvider>
    └── HomeScreen (StatefulWidget)
        └── Scaffold
            ├── AppBar
            │   ├── Text("Todo List")
            │   └── IconButton (History)
            └── Column
                ├── Input Section (TextField + Button)
                └── Expanded
                    └── Consumer<TodoProvider>
                        └── ListView.builder
                            └── TodoItem (Card + ListTile)
                                ├── Checkbox
                                ├── Text (Title + Date)
                                ├── Edit Button
                                └── Delete Button
Navigator → HistoryScreen (StatelessWidget)
```

---

## 🧩 Stateless vs Stateful  

### 📌 StatelessWidget  
- `TodoItem` → hanya menampilkan data  
- `HistoryScreen` → menampilkan daftar todo selesai  
- `MyApp` → root widget aplikasi  

### 📌 StatefulWidget  
- `HomeScreen` → mengelola input field dan interaksi user  
- Menggunakan `setState()` pada level lokal input  
- Memanfaatkan `Provider` untuk state global  

---

## 💡 Alasan Memakai Provider  
1. 🟢 **Sederhana & mudah dipahami** untuk pemula  
2. ⚡ **Efisien**: hanya rebuild widget yang perlu  
3. ✅ **Direkomendasikan resmi oleh Flutter**  
4. 📚 **Learning curve rendah**: cocok untuk belajar state management  
5. 📈 **Scalable**: bisa dipakai di aplikasi kompleks  

---

## 📱 Preview Aplikasi  

### 🏠 Home Screen  
- Tambah todo dengan input field  
- Checklist todo yang aktif  
- Edit & hapus todo  
- Navigasi ke History  

### 🗂️ History Screen  
- Menampilkan todo yang sudah selesai  
- Bisa edit & hapus juga  
- Tombol kembali ke Home  

---

## 🚨 Validasi  
- ❌ Tidak bisa menambahkan todo kosong  
- ⚠️ Konfirmasi sebelum menghapus  
- ✅ Validasi input saat edit  

---

## ▶️ Cara Menjalankan  

1. Pastikan **Flutter SDK** sudah terinstall  
2. Jalankan:  

```sh
flutter pub get
flutter run
```

---

## 🖼️ Screenshot  

![Todo List App](screenshots/todo_app_screenshot.png)  
*Catatan: Ganti path screenshot dengan file asli hasil aplikasi dijalankan.*  

---

## 📜 Lisensi  
Proyek ini menggunakan lisensi **MIT** – silakan gunakan & kembangkan 🚀  
