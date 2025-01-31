# 📌 Aplikasi Pengingat Sebelum Belanja

![Flutter](https://img.shields.io/badge/Flutter-3.10.0-blue?logo=flutter)
![Laravel](https://img.shields.io/badge/Laravel-10-red?logo=laravel)
![MySQL](https://img.shields.io/badge/Database-MySQL-orange?logo=mysql)
![API](https://img.shields.io/badge/RESTful-API-green)

## 📌 Informasi Proyek

- **Mata Kuliah:** Pemrograman Mobile  
- **Nama:** Bayu Sukmo Adji  
- **NIM:** 20220801089  
- **Dosen Pengampu:**  JEFRY SUNUPURWA ASRI , S.Kom., M.Kom. (8126) 
- **Teknologi:** Flutter (Dart) & Laravel (PHP)  
- **Database:** MySQL  

---

## 🚀 **Deskripsi Proyek**
Aplikasi **Pengingat Sebelum Belanja** dibuat untuk membantu pengguna dalam mencatat daftar belanja dan mendapatkan pengingat sebelum mereka pergi ke pasar atau supermarket. Dengan aplikasi ini, pengguna dapat:  

✅ **Menambahkan pengingat belanja** dengan judul, deskripsi, dan tanggal.  
✅ **Menampilkan daftar pengingat yang telah dibuat.**  
✅ **Menampilkan detail pengingat ketika diklik.**  
✅ **Menghapus pengingat yang tidak diperlukan.**  

Aplikasi ini dibangun menggunakan **Flutter untuk frontend** dan **Laravel untuk backend**, dengan komunikasi data melalui **RESTful API**.  

---

## 🛠 **Teknologi yang Digunakan**
| Komponen  | Teknologi |
|-----------|----------|
| **Frontend** | Flutter (Dart) |
| **Backend** | Laravel (PHP) |
| **Database** | MySQL |
| **API** | RESTful API |
| **State Management** | setState() |

---

## 📱 **Fitur Utama**
### ✅ 1. Menambahkan Pengingat  
- Pengguna dapat **menambahkan pengingat baru** dengan **judul, deskripsi, dan tanggal**.  
- Data dikirim ke **backend Laravel** dan disimpan di **database MySQL**.  

### ✅ 2. Menampilkan Daftar Pengingat  
- Aplikasi menampilkan **daftar pengingat** yang tersimpan di database.  
- Data diambil melalui **API dari Laravel**.  

### ✅ 3. Menampilkan Detail Pengingat  
- Pengguna dapat **melihat detail pengingat** dengan mengklik item pada daftar.  
- Detail termasuk **judul, deskripsi, dan tanggal pengingat**.  

### ✅ 4. Menghapus Pengingat  
- Pengguna dapat **menghapus pengingat yang tidak diperlukan**.  
- Data dihapus dari **backend dan database**.  
- **Tampilan diperbarui secara otomatis** setelah penghapusan.  

---

## 📂 **Struktur Folder**


---

## 📌 **Instalasi & Cara Menjalankan**
### **1️⃣ Menjalankan Backend (Laravel)**
```sh
# Clone repositori
git clone https://github.com/username/pengingat-belanja.git

# Masuk ke folder backend Laravel
cd backend

# Install dependencies Laravel
composer install

# Konfigurasi database .env
cp .env.example .env
php artisan key:generate

# Migrasi database
php artisan migrate

# Jalankan server Laravel
php artisan serve


# Masuk ke folder proyek Flutter
cd pengingat_belanja

# Install dependencies Flutter
flutter pub get

# Jalankan aplikasi
flutter run


<img width="703" alt="image" src="https://github.com/user-attachments/assets/07e7c809-0175-4d71-a06e-63dc6264c758" />
