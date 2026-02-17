# 🏦 Financial Report CLI Tool

Tools CLI untuk membuat laporan keuangan bank yang berjalan di Kali Linux Terminal dengan integrasi langsung ke Microsoft Excel.

## ✨ Fitur

- **📊 Laporan Keuangan Lengkap**: Neraca, Laba Rugi, dan Arus Kas
- **📁 Output Excel Profesional**: Format sesuai standar akuntansi Indonesia
- **⚖️ Aturan Akuntansi Otomatis**: Debit-Kredit sesuai PSAK
- **🖥️ Interface Terminal**: User-friendly dengan menu interaktif
- **💾 Data Persistent**: Simpan dan kelola transaksi
- **📈 Perhitungan Otomatis**: Rumus Excel untuk semua perhitungan

## 🚀 Instalasi

### Otomatis (Recommended)

```bash
# Clone atau download repository
cd /path/to/bank_financial_report

# Jalankan installer
chmod +x install.sh
sudo ./install.sh
```

### Manual

```bash
# Install dependencies
pip3 install -r requirements.txt

# Jalankan langsung
python3 bank_financial_report.py
```

## 📖 Penggunaan

### Mode Interaktif (Default)

```bash
bankfin
```

### Mode Demo (dengan data contoh)

```bash
bankfin --demo
```

### Generate Langsung ke File

```bash
bankfin -o laporan_bulanan.xlsx
```

### Bantuan

```bash
bankfin --help
```

## 📋 Menu Utama

| No | Menu | Deskripsi |
|----|------|-----------|
| 1 | Input Transaksi Baru | Tambah transaksi dengan aturan debit-kredit |
| 2 | Lihat Daftar Transaksi | Tampilkan semua transaksi yang tercatat |
| 3 | Edit Transaksi | Ubah data transaksi yang sudah ada |
| 4 | Hapus Transaksi | Hapus transaksi dari daftar |
| 5 | Set Saldo Awal | Atur saldo awal periode |
| 6 | Generate Laporan Excel | Buat file laporan keuangan |
| 7 | Setting Informasi Bank | Atur nama bank dan periode |

## 💰 Jenis Transaksi yang Didukung

| Kode | Transaksi | Akun Debit | Akun Kredit |
|------|-----------|------------|-------------|
| 1 | Setoran Tunai | Kas ↑ | Modal ↑ |
| 2 | Penarikan Tunai | Modal ↓ | Kas ↓ |
| 3 | Transfer Masuk | Bank ↑ | Pendapatan ↑ |
| 4 | Transfer Keluar | Beban ↑ | Bank ↓ |
| 5 | Pembayaran Tagihan | Hutang ↓ | Bank ↓ |
| 6 | Pembelian/Investasi | Aset ↑ | Bank ↓ |
| 7 | Bunga Masuk | Bank ↑ | Pendapatan Bunga ↑ |
| 8 | Biaya Administrasi | Beban ↑ | Bank ↓ |
| 9 | Pinjaman Masuk | Bank ↑ | Pinjaman ↑ |
| 10 | Angsuran Keluar | Pinjaman ↓ | Bank ↓ |

## 📊 Output Excel

Tools ini menghasilkan file Excel dengan 5 sheet:

1. **Cover** - Halaman sampul dengan ringkasan keuangan
2. **Jurnal Transaksi** - Daftar semua transaksi yang tercatat
3. **Neraca** - Laporan posisi keuangan (Aset = Kewajiban + Ekuitas)
4. **Laba Rugi** - Laporan laba rugi periode berjalan
5. **Arus Kas** - Laporan arus kas masuk dan keluar

## 🎨 Format Excel

- **Style**: Professional Finance Style
- **Currency**: Format Rupiah (Rp)
- **Colors**: Blue header, alternating rows
- **Formulas**: Semua perhitungan menggunakan rumus Excel
- **Validation**: Neraca otomatis dicek keseimbangannya

## 🔧 Persyaratan Sistem

- **OS**: Kali Linux / Debian-based
- **Python**: 3.7+
- **Packages**: openpyxl, pandas

## 📝 Contoh Penggunaan

### 1. Input Transaksi Setoran

```
Pilih jenis transaksi [0-10]: 1
Tanggal (YYYY-MM-DD): 2026-01-15
Keterangan: Setoran Modal Awal
Nominal (Rp): 100000000
No. Referensi: TRX-001
```

### 2. Input Bunga Bank

```
Pilih jenis transaksi [0-10]: 7
Tanggal: 2026-01-01
Keterangan: Bunga Deposito Januari
Nominal: 2500000
```

### 3. Generate Laporan

```
Pilih menu [0-7]: 6
Nama file output: laporan_januari_2026.xlsx
📊 Generating Excel report: laporan_januari_2026.xlsx...
✅ Laporan berhasil disimpan: laporan_januari_2026.xlsx
```

## 📐 Aturan Akuntansi yang Diterapkan

### Persamaan Dasar Akuntansi
```
ASET = KEWAJIBAN + EKUITAS
```

### Klasifikasi Akun

**Aset (Debit ↑, Kredit ↓)**
- Kas
- Bank
- Piutang
- Investasi

**Kewajiban (Debit ↓, Kredit ↑)**
- Hutang
- Pinjaman

**Ekuitas (Debit ↓, Kredit ↑)**
- Modal
- Laba Ditahan

**Pendapatan (Debit ↓, Kredit ↑)**
- Pendapatan Bunga
- Pendapatan Operasional

**Beban (Debit ↑, Kredit ↓)**
- Beban Administrasi
- Beban Operasional

## 🔒 Keamanan

- Data disimpan dalam memori (tidak persisten antar sesi)
- File Excel disimpan secara lokal
- Tidak ada koneksi ke server eksternal

## 🐛 Troubleshooting

### Permission Denied
```bash
chmod +x bank_financial_report.py
```

### Module Not Found
```bash
pip3 install openpyxl pandas
```

### Command Not Found (setelah install)
```bash
source ~/.bashrc
# atau
export PATH=$PATH:/usr/local/bin
```

## 📄 Lisensi

MIT License - Free for personal and commercial use

## 🤝 Kontribusi

Pull request dan saran selalu diterima!
