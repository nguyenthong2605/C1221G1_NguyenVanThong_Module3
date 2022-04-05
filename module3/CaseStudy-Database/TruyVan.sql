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
select  dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
left join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
inner join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
inner join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where year(ngay_ket_thuc) = 2020
and hop_dong.ma_dich_vu not in (select hop_dong.ma_dich_vu from hop_dong where year(ngay_ket_thuc) = 2021 )
group by hop_dong.ma_dich_vu;

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
group by khach_hang.ho_ten;

-- Câu 9:
select month(hop_dong.ngay_lam_hop_dong) as thang , count(hop_dong.ma_khach_hang) as so_luong_khach_hang
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2021
group by thang;

-- Câu 10:
select hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc,  coalesce(sum(hop_dong_chi_tiet.so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
group by hop_dong.ma_hop_dong;

-- Câu 11: 
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem
from dich_vu_di_kem
inner join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
inner join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
inner join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
inner join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
where loai_khach.ten_loai_khach_hang = 'Diamond' and (khach_hang.dia_chi like '%Vinh' or khach_hang.dia_chi like '%Quãng Ngãi');

-- Câu 12:
select hop_dong.ma_hop_dong, nhan_vien.ho_ten as ho_ten_nhan_vien, khach_hang.ho_ten as ho_ten_khach_hang, khach_hang.so_dien_thoai as sdt_khach_hang, dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem, hop_dong.tien_dat_coc
from hop_dong
left join nhan_vien on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
left join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
where (hop_dong.ngay_lam_hop_dong between '2020-10-01' and '2020-12-31') and (hop_dong.ngay_lam_hop_dong not between '2021-01-01' and '2021-06-30')
group by hop_dong.ma_hop_dong;


-- Câu 13: 
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem, max(bang_tinh_tong.so_luong_dich_vu_di_kem) as so_luong_dich_vu_di_kem_lon_nhat
from hop_dong_chi_tiet hdct
inner join
	(
    select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem, sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
	from hop_dong_chi_tiet
	inner join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
	group by hop_dong_chi_tiet.ma_dich_vu_di_kem) as bang_tinh_tong on hdct.so_luong_dich_vu_di_kem = bang_tinh_tong.so_luong_dich_vu_di_kem group by hdct.ma_dich_vu_di_kem ;

select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem, sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
from hop_dong_chi_tiet
inner join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by hop_dong_chi_tiet.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem = (select sum(so_luong) as so_luong_lon_nhat from hop_dong_chi_tiet group by ma_dich_vu_di_kem order by so_luong desc limit 1);

-- Câu 14:
select hop_dong_chi_tiet.ma_hop_dong, loai_dich_vu.ten_loai_dich_vu, dich_vu_di_kem.ten_dich_vu_di_kem, count(hop_dong_chi_tiet.so_luong) as so_lan_su_dung
from hop_dong
inner join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
inner join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
inner join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
inner join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by hop_dong_chi_tiet.ma_dich_vu_di_kem
having so_lan_su_dung = 1;


-- Câu 15:
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten, trinh_do.ten_trinh_do, bo_phan.ten_bo_phan, nhan_vien.so_dien_thoai, nhan_vien.dia_chi, count(hop_dong.ma_nhan_vien) as dem_hop_dong
from nhan_vien
inner join hop_dong on hop_dong.ma_nhan_vien =  nhan_vien.ma_nhan_vien
inner join trinh_do on trinh_do.ma_trinh_do = nhan_vien.ma_trinh_do
inner join bo_phan on bo_phan.ma_bo_phan = nhan_vien.ma_bo_phan
group by hop_dong.ma_nhan_vien
having dem_hop_dong <=3;




-- Câu 16:
delete from nhan_vien 
where nhan_vien.ma_nhan_vien not in (	
	select ma_nhan_vien from (
		select distinct nhan_vien.ma_nhan_vien 
		from  nhan_vien 
		join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
		where year (hop_dong.ngay_lam_hop_dong) between '2019' and '2021') as table_ma_nhan_vien_khong_xoa);

-- Câu 17:
update khach_hang
set khach_hang.ma_loai_khach = 1
where ( khach_hang.ma_khach_hang in (select ma_khach_hang from (
select khach_hang.ma_khach_hang, khach_hang.ho_ten, khach_hang.ma_loai_khach, sum(chi_phi_thue + coalesce((hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia),0)) as tong_tien
from khach_hang
left join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
left join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
right join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
right join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where loai_khach.ma_loai_khach = 2 and year(hop_dong.ngay_lam_hop_dong) = '2021' and year(hop_dong.ngay_ket_thuc) = '2021'
group by hop_dong.ma_hop_dong
having tong_tien >= 10000000) as table_ma_nhan_vien_can_thay_doi));


-- Câu 18:
set foreign_key_checks = 0;
delete from khach_hang
where  khach_hang.ma_khach_hang in ( select ma_khach_hang from (
select khach_hang.ma_khach_hang, khach_hang.ho_ten
from khach_hang
inner join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
where year(hop_dong.ngay_ket_thuc) = '2020') as table_ma_khach_hang_can_xoa);
set foreign_key_checks = 1;
 
 
 -- Câu 19:
 update dich_vu_di_kem
 set dich_vu_di_kem.gia = dich_vu_di_kem.gia * 2
 where dich_vu_di_kem.ma_dich_vu_di_kem in (select ma_dich_vu_di_kem from(
 select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem, sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
 from dich_vu_di_kem
 right join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
 right join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
 where year(hop_dong.ngay_ket_thuc) = '2020'
 group by hop_dong_chi_tiet.ma_dich_vu_di_kem
 having so_luong_dich_vu_di_kem > 10) as table_so_luong_dich_vu_di_kem_lon_hon_15);
 
 -- Câu 20:
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten, nhan_vien.email, nhan_vien.so_dien_thoai, nhan_vien.ngay_sinh, nhan_vien.dia_chi
from nhan_vien
union all
select khach_hang.ma_khach_hang, khach_hang.ho_ten, khach_hang.email, khach_hang.so_dien_thoai, khach_hang.ngay_sinh, khach_hang.dia_chi
from khach_hang;

-- Câu 21:
create view v_nhan_vien as
select *
from nhan_vien 
where nhan_vien.dia_chi like '%Hải Châu%' and nhan_vien.ma_nhan_vien in (select ma_nhan_vien from hop_dong
where hop_dong.ngay_lam_hop_dong = '2019-12-12') ;

-- Câu 22:
set sql_safe_updates = 0;
update v_nhan_vien
set dia_chi = replace(dia_chi, 'Hải Châu', 'Liên Chiểu');
set sql_safe_updates = 1;

select * from v_nhan_vien;
-- Câu 23:
-- Tạo store procedure lấy tất cả thông tin của tất cả các khách hàng
delimiter //
create procedure sp_khach_hang()
	begin
		select * from khach_hang;
    end //
delimiter ;
call sp_khach_hang;

-- Tạo store procedure xóa thông tin của một khách hàng nào bằng mã khách hàng được truyền vào
delimiter //
create procedure sp_xoa_khach_hang(ma_khach_hang_can_xoa int)
	begin
		alter table hop_dong
        drop foreign key hop_dong_ibfk_2;
        alter table hop_dong
        add constraint hop_dong_ibfk_2 foreign key(ma_khach_hang) references khach_hang(ma_khach_hang) on delete set null;
		delete
        from khach_hang
        where khach_hang.ma_khach_hang = ma_khach_hang_can_xoa;
    end //
delimiter ;

call sp_xoa_khach_hang(1);


-- Câu 24:
delimiter // 
create procedure sp_them_moi_hop_dong(in them_ngay_lam_hop_dong datetime, them_ngay_ket_thuc datetime, them_tien_dat_coc double, them_ma_nhan_vien int, them_ma_khach_hang int, them_ma_dich_vu int)
	begin 
		if datediff(them_ngay_lam_hop-dong, them_ngay_ket_thuc) < 0 then
		insert into hop_dong(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu) value
        (them_ngay_lam_hop-dong, them_ngay_ket_thuc, them_tien_dat_coc,
        (select ma_nhan_vien 
        from nhan_vien
        where ma_nhan_vien = them_ma_nhan_vien),
        (select ma_khach_hang
        from khach_hang
        where ma_khach_hang = them_ma_khach_hang),
        (select ma_dich_vu
        from dich_vu
        where ma_dich_vu = them_ma_dich_vu));
        end if;
	end //
delimiter ;
call sp_them_moi_hop_dong();

-- Câu 25:
create table tong_so_luong_hop_dong_con_lai(
so_luong int 
);
-- insert into tong_so_luong_hop_dong_con_lai(so_luong)
-- select count(hop_dong.ma_hop_dong) as tong_so_luong
-- from hop_dong;
delimiter //
create trigger tr_xoa_hop_dong 
after delete on hop_dong for each row 
begin
	declare sl int;
    set sl = (select count(hop_dong.ma_hop_dong) from hop_dong);
	update tong_so_luong_hop_dong_con_lai
    set tong_so_luong_hop_dong_con_lai.so_luong = sl;
end //
delimiter ;
drop trigger tr_xoa_hop_dong;
set sql_safe_updates = 0;
delete from hop_dong
where hop_dong.ma_hop_dong = 5;
set sql_safe_updates = 1;

-- Câu 26: 
