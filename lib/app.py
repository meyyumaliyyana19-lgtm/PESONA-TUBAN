import streamlit as st
import pandas as pd

# Konfigurasi Halaman
st.set_page_config(page_title="Toko Pink Kasir", page_icon="🎀", layout="centered")

# Custom CSS untuk Mengubah Tampilan Menjadi Pink
st.markdown("""
    <style>
    /* Warna Background Utama */
    .stApp {
        background-color: #FFF0F5; /* Light Pink / LavenderBlush */
    }
    /* Warna Judul & Teks */
    h1, h2, h3, h4, label {
        color: #D81B60 !important; /* Deep Pink */
    }
    /* Desain Tombol */
    div.stButton > button {
        background-color: #FF69B4 !important; /* Hot Pink */
        color: white !important;
        border-radius: 12px !important;
        border: none !important;
        font-weight: bold !important;
        padding: 0.5rem 1rem !important;
    }
    div.stButton > button:hover {
        background-color: #C71585 !important; /* Medium Violet Red */
        color: white !important;
    }
    /* Desain Input Box */
    .stTextInput>div>div>input, .stNumberInput>div>div>input, .stSelectbox>div>div>div {
        border-radius: 8px !important;
        border: 1px solid #FFB6C1 !important;
    }
    </style>
""", unsafe_allow_html=True)

# Judul Aplikasi
st.title("🎀 Kasir Serba Pink 🛍️")
st.write("Silakan pilih barang dari katalog atau tambahkan barang custom ke keranjang!")

# Menggunakan Session State untuk menyimpan item di Keranjang Belanja
if 'keranjang' not in st.session_state:
    st.session_state.keranjang = []

# 1. Daftar Katalog Barang
katalog = {
    "🌸 Kopi Pink Velvet": 20000,
    "🧋 Strawberry Boba Milk": 25000,
    "🍰 Soft Pink Cake Slice": 30000,
    "🍩 Donat Glaze Pink": 12000,
    "🥤 Ice Pink Lemonade": 15000,
    "🍦 Ice Cream Strawberry": 18000,
    "✨ Barang Custom (Isi Manual)": 0
}

st.subheader("➕ Tambah Barang ke Keranjang")
col1, col2 = st.columns(2)

with col1:
    pilihan_barang = st.selectbox("Pilih Produk:", list(katalog.keys()))
    
    if pilihan_barang == "✨ Barang Custom (Isi Manual)":
        nama_barang = st.text_input("Nama Barang:")
        harga_satuan = st.number_input("Harga Satuan (Rp):", min_value=0, value=10000, step=1000)
    else:
        nama_barang = pilihan_barang
        harga_satuan = katalog[pilihan_barang]
        st.info(f"Harga Satuan: **Rp {harga_satuan:,.0f}**")

with col2:
    jumlah_beli = st.number_input("Jumlah Beli:", min_value=1, value=1, step=1)
    st.write("") # Jarak Spasi
    if st.button("🛒 Tambahkan ke Keranjang", use_container_width=True):
        if nama_barang:
            subtotal = harga_satuan * jumlah_beli
            st.session_state.keranjang.append({
                "Nama Barang": nama_barang,
                "Harga Satuan": harga_satuan,
                "Jumlah": jumlah_beli,
                "Subtotal": subtotal
            })
            st.toast(f"✅ {nama_barang} dimasukkan ke keranjang!", icon="💖")
        else:
            st.error("Nama barang tidak boleh kosong!")

st.divider()

# 2. Tampilan Keranjang Belanja
st.subheader("🧺 Keranjang Belanja Anda")

if len(st.session_state.keranjang) > 0:
    df_keranjang = pd.DataFrame(st.session_state.keranjang)
    
    # Format Tampilan Angka Mata Uang di Tabel
    df_display = df_keranjang.copy()
    df_display["Harga Satuan"] = df_display["Harga Satuan"].apply(lambda x: f"Rp {x:,.0f}")
    df_display["Subtotal"] = df_display["Subtotal"].apply(lambda x: f"Rp {x:,.0f}")
    
    st.dataframe(df_display, use_container_width=True)
    
    # Hitung Total Pembayaran & Diskon
    total_awal = sum(item["Subtotal"] for item in st.session_state.keranjang)
    diskon = 0.0
    
    if total_awal >= 100000:
        diskon = total_awal * 0.10
        st.success("💖 Diskon 10% diterapkan untuk belanjaan di atas Rp 100.000!")

    total_bayar = total_awal - diskon
    
    col_tot1, col_tot2 = st.columns(2)
    with col_tot1:
        st.write(f"**Total Awal:** Rp {total_awal:,.0f}")
        st.write(f"**Diskon (10%):** Rp {diskon:,.0f}")
        st.markdown(f"### **Total Bayar: Rp {total_bayar:,.0f}**")
        
    with col_tot2:
        uang_bayar = st.number_input("Uang Pembayaran (Rp):", min_value=0, value=int(total_bayar), step=5000)
        
        if st.button("💳 Selesaikan Pembayaran", use_container_width=True):
            if uang_bayar >= total_bayar:
                kembalian = uang_bayar - total_bayar
                st.balloons()
                st.success(f"🎉 Transaksi Berhasil! Kembalian Anda: Rp {kembalian:,.0f}")
            else:
                st.error(f"⚠️ Uang pembayaran kurang Rp {total_bayar - uang_bayar:,.0f}")
    
    if st.button("🗑️ Kosongkan Keranjang"):
        st.session_state.keranjang = []
        st.rerun()

else:
    st.info("Keranjang masih kosong. Silakan pilih produk di atas lalu klik 'Tambahkan ke Keranjang'.")