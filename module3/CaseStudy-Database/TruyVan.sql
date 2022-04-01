use case_study_furama;
-- Câu 2:
select ma_nhan_vien, ho_ten
from nhan_vien
where ho_ten regexp '^[HKT]\.' and length(ho_ten) <= 16;


-- Câu 3: 
select *
from khach_hang
where (year(current_date) - year(ngay_sinh) between 18 and 50) and (dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%');


-- Câu 4:
select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(hop_dong.ma_khach_hang) as so_lan_dat_phong
from khach_hang
inner join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
where khach_hang.ma_loai_khach = 1
group by hop_dong.ma_khach_hang
order by so_lan_dat_phong asc;

-- Câu 5:
select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach_hang, hop_dong.ma_hop_dong, dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, sum(chi_phi_thue + coalesce((hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia),0)) as tong_tien
from hop_dong_chi_tiet
left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
right join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
right join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
group by hop_dong.ma_hop_dong;

-- Câu 6:
select distinct dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu 
left join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
right join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where hop_dong.ngay_lam_hop_dong not between '2021-01-01' and '2021-03-31'
and hop_dong.ma_dich_vu not in (select hop_dong.ma_dich_vu from hop_dong where  hop_dong.ngay_lam_hop_dong between '2021-01-01' and '2021-03-31');

-- Câu 7:
select distinct dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
left join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
inner join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
inner join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where year(ngay_ket_thuc) = 2020
and hop_dong.ma_dich_vu not in (select hop_dong.ma_dich_vu from hop_dong where year(ngay_ket_thuc) = 2021 );

-- Câu 8:
select distinct khach_hang.ho_ten
from khach_hang;

select khach_hang.ho_ten
from khach_hang
union
select khach_hang.ho_ten
from khach_hang;

select khach_hang.ho_ten
from khach_hang
group by khach_hang.ho_ten

-- Câu 9: 




