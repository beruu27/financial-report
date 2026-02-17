# 🚀 Quick Start Guide - Bank Financial Report CLI

## Instalasi Cepat

```bash
# 1. Download dan extract
# 2. Jalankan installer
chmod +x install.sh
sudo ./install.sh

# 3. Selesai! Gunakan bankfin
bankfin
```

## Penggunaan Dasar

### 1. Jalankan Mode Interaktif
```bash
bankfin
```

### 2. Input Transaksi Pertama
```
Pilih menu [0-7]: 1
Pilih jenis transaksi [0-10]: 1
Tanggal: 2026-01-01
Keterangan: Setoran Modal Awal
Nominal: 100000000
```

### 3. Generate Laporan
```
Pilih menu [0-7]: 6
Nama file: laporan_januari.xlsx
```

## Perintah Berguna

| Perintah | Deskripsi |
|----------|-----------|
| `bankfin` | Mode interaktif |
| `bankfin --demo` | Demo dengan data contoh |
| `bankfin -o file.xlsx` | Generate langsung ke file |
| `bankfin --help` | Bantuan |

## Jenis Transaksi

| Kode | Transaksi | Efek |
|------|-----------|------|
| 1 | Setoran Tunai | Kas ↑, Modal ↑ |
| 2 | Penarikan Tunai | Kas ↓, Modal ↓ |
| 3 | Transfer Masuk | Bank ↑, Pendapatan ↑ |
| 4 | Transfer Keluar | Bank ↓, Beban ↑ |
| 5 | Pembayaran Tagihan | Hutang ↓, Bank ↓ |
| 6 | Pembelian/Investasi | Aset ↑, Bank ↓ |
| 7 | Bunga Masuk | Bank ↑, Pendapatan Bunga ↑ |
| 8 | Biaya Admin | Beban ↑, Bank ↓ |
| 9 | Pinjaman Masuk | Bank ↑, Pinjaman ↑ |
| 10 | Angsuran Keluar | Pinjaman ↓, Bank ↓ |

## Output Excel

File Excel berisi 5 sheet:
1. **Cover** - Ringkasan dan daftar isi
2. **Jurnal Transaksi** - Semua transaksi
3. **Neraca** - Aset = Kewajiban + Ekuitas
4. **Laba Rugi** - Pendapatan - Beban
5. **Arus Kas** - Kas masuk dan keluar

## Tips

- Gunakan `--demo` untuk melihat contoh laporan
- Saldo awal bisa diatur via menu 5
- Informasi bank bisa diubah via menu 7
- Semua perhitungan menggunakan rumus Excel
