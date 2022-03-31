use case_study_furama;
-- Câu 2:
select ma_nhan_vien, ho_ten
from nhan_vien
where ho_ten regexp '^[HKT]\.' and length(ho_ten) <= 16;


-- Câu 3: 
select *
from khach_hang
where (year(current_date) - year(ngay_sinh) between 18 and 50) and (dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%');


-- câu 4:
select 

