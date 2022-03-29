create database mo_hinh_quan_he;
use mo_hinh_quan_he;

create table phieu_xuat(
so_px int primary key auto_increment,
ngay_xuat datetime
);

create table vat_tu(
ma_vtu int primary key auto_increment,
ten_vtu varchar(50)
);

create table phieu_xuat_chi_tiet_phieu_xuat_vat_tu(
so_px int,
ma_vtu int,
dg_xuat double,
sl_xuat int,
primary key (so_px, ma_vtu),
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vtu) references vat_tu(ten_vtu)
);

create table phieu_nhap(
so_pn int primary key auto_increment,
ngay_nhap datetime
);

create table phieu_nhap_chi_tiet_phieu_nhap_vat_tu(
so_pn int,
ma_vtu int,
dg_nhap double,
sl_nhap int,
primary key(so_pn, ma_vtu),
foreign key(so_pn) references phieu_nhap(so_pn),
foreign key(ma_vtu) references vat_tu(ma_vtu)
);



