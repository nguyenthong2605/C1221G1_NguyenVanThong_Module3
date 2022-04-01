use quan_ly_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * 
from subject
where Credit >= (select max(Credit) from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select subject.*, max(mark.Mark) as diem_thi_lon_nhat 
from subject
join mark on mark.SubId = subject.SubId
where Mark >= (select max(Mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.*, avg(Mark) as diem_trung_binh
from student
join mark on mark.StudentId = student.StudentId
group by student.StudentId
order by Mark asc;

