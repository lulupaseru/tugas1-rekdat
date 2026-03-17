# Tugas 1 - Rekayasa Data (AMS232374-03)

## Deskripsi Tugas
Repositori ini berisi penyelesaian **Tugas 1** untuk mata kuliah **AMS232374-03 - Rekayasa Data**. Tugas ini berfokus pada eksplorasi, manipulasi, dan analisis data akademik universitas menggunakan **Notasi Aljabar Relasional** dan **Perintah SQL**, beserta interpretasi analitik dari hasil/keluarannya.

---

## Skema Basis Data
Diberikan empat tabel dari basis data universitas sebagai berikut.

### 1. Tabel `mahasiswa`
Berisi informasi data mahasiswa.
- `NPM` *(String/Int)*: Nomor induk mahasiswa 
- `Nama` *(String)*: Nama mahasiswa
- `Angkatan` *(Int)*: Tahun masuk mahasiswa
- `Prodi` *(String)*: Program studi mahasiswa
- `IPK` *(Float)*: Indeks prestasi kumulatif mahasiswa

### 2. Tabel `dosen`
Berisi informasi data dosen.
- `NIDN` *(String/Int)*: Nomor induk dosen nasional
- `NamaDosen` *(String)*: Nama dosen
- `Prodi` *(String)*: Program studi dosen

### 3. Tabel `mata_kuliah`
Berisi informasi mata kuliah.
- `KodeMK` *(String)*: Kode mata kuliah 
- `NamaMK` *(String)*: Nama mata kuliah
- `SKS` *(Int)*: Jumlah satuan kredit semester
- `Prodi` *(String)*: Program studi penyelenggara

### 4. Tabel `krs`
Berisi data riwayat pengambilan mata kuliah oleh mahasiswa.
- `NPM` *(String/Int)*: Mahasiswa yang mengambil mata kuliah
- `KodeMK` *(String)*: Mata kuliah yang diambil
- `Semester` *(Int)*: Semester pengambilan
- `Nilai` *(String/Float)*: Nilai akhir mahasiswa

---

## Daftar Tugas
Proyek ini menjawab 20 pertanyaan yang secara garis besar meliputi:
1. **Integritas & Pembersihan Data:** Evaluasi atribut, pengecekan nilai kosong (*NULL*), dan pembuktian ketiadaan baris duplikat.
2. **Statistik Deskriptif:** Perhitungan ukuran pemusatan dan penyebaran data (Rata-rata, Min, Max, Standar Deviasi) untuk atribut numerik, serta pembuatan tabel frekuensi untuk atribut kategorikal.
3. **Agregasi Data Mahasiswa:** Perhitungan jumlah mata kuliah yang diambil, SKS tertinggi, hingga klasifikasi mahasiswa "lebih aktif".
4. **Analisis Lintas Entitas (Cross-Table):** - Identifikasi mahasiswa yang mengambil mata kuliah dengan spesifikasi tertentu (misal: hanya mengambil kelas 3 SKS).
   - Analisis perilaku mahasiswa lintas program studi.
5. **Korelasi Akademik:** Menjelaskan tren dan hubungan antara nilai IPK, SKS, beban mata kuliah, dan angkatan studi.

---

Kumpulan perintah SQL dapat dilihat pada file [Query Jawaban SQL](Kode%20SQL%20Tugas%201.sql).