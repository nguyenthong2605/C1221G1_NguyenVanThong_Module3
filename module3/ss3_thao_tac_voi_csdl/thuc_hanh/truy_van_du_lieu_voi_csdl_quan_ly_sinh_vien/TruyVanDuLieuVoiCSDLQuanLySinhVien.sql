USE quan_ly_sinh_vien;

 -- Hiển thị danh sách tất cả học viên
SELECT * FROM student;

-- Hiển thị danh sách học viên đang theo học
SELECT * 
FROM student
WHERE Status = true;

-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
SELECT *
FROM subject
WHERE Credit < 10;

-- Hiển thị danh sách học viên lớp A1
SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId;

-- Hiển thị điểm môn CF của các học viên.
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';

