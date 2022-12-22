﻿CREATE DATABASE Cartesian 
--	DB ~~~ KHO ~~~ TỦ ~~~ THÙNG CHỨA DATA BÊN TRONG 
--	DATA BÊN TRONG CẤT DƯỚI DẠNG KỆ CÓ NGĂN - TABLE 

CREATE TABLE EnDict			-- DDL (một nhánh của SQL) 
(							-- Data Definition Language 
	Nmbr int,
	EnDesc varchar(30)
)-- Từ điển T.Anh số đếm 

--DROP TABLE EnDict			-- DDL

SELECT * FROM EnDict		-- DML Data Manipulation Language 

INSERT INTO EnDict VALUES(1, 'One')  --DML 
INSERT INTO EnDict VALUES(2, 'Two')
INSERT INTO EnDict VALUES(3, 'Three')

--PHẦN NÀY THÊM CHO OUTER JOIN 
INSERT INTO EnDict VALUES(4, 'Four')

CREATE TABLE VnDict
(
	Nmbr int,
	VnDesc nvarchar(30)		-- nvatchar() String lưu tiếng Việt
							-- varchar() String lưu tiếng Anh 
)
SELECT * FROM VnDict

INSERT INTO VnDict VALUES (1, N'Một')
INSERT INTO VnDict VALUES (2, N'Hai')
INSERT INTO VnDict VALUES (3, N'Ba')

--PHẦN NÀY THÊM CHO OUTER JOIN 
INSERT INTO VnDict VALUES (5, N'Năm')

SELECT * FROM EnDict
SELECT * FROM VnDict
-- BÔI ĐEN CẢ 2 LỆNH NÀY CHẠY, THÌ NÓ KO PHẢI LÀ JOIN, NÓ LÀ 2 CÂU RIÊNG BIỆT CHẠY
-- CÙNG LÚC, CHO 2 TẬP KẾT QUẢ RIÊNG BIỆT!!!
-- JOIN LÀ GỘP CHUNG 1 THÀNH 1 BẢNG TẠM TRONG RAM, KO ẢNH HƯỞNG DỮ LIỆU GỐC CỦA MỖI TABLE
-- JOIN LÀ SELECT CÙNG LÚC NHIỀU TABLE 

SELECT * FROM VnDict, EnDict	-- sinh table mới, tạm thời lúc chạy hoy
								-- số cột  = tổng 2 bên
								-- số dòng = tích 2 bên 

SELECT * FROM VnDict, EnDict ORDER BY Nmbr -- Ambiguous - Bối rối trùng tên 
-- GHÉP TABLE, JOIN BỊ TRÙNG TÊN CỘT, DÙNG ALIAS (AS), ĐẶT TÊN GIẢ ĐỂ THAM CHIẾU
--									  CHỈ ĐỊNH CỘT THUỘC TABLE NÀO ĐỂ TRÁNH NHẦM 

SELECT * FROM VnDict, EnDict ORDER BY VnDict.Nmbr	--tham chiếu cột qua tên table
SELECT * FROM VnDict vn, EnDict en ORDER BY en.Nmbr --đặt tên ngắn/giả cho table
													--dùng tham chiếu cho các cột 

SELECT vn.Nmbr, vn.VnDesc, en.EnDesc FROM VnDict vn, EnDict en ORDER BY en.Nmbr

SELECT vn.*, en.EnDesc FROM VnDict vn, EnDict en ORDER BY en.Nmbr

SELECT vn.*, en.* FROM VnDict vn, EnDict en ORDER BY en.Nmbr

--CÚ PHÁP VIẾT THỨ 2 -- CHUẨN 
SELECT vn.Nmbr, vn.VnDesc, en.EnDesc FROM VnDict vn CROSS JOIN EnDict en ORDER BY en.Nmbr


--Tui biết rằng có cặp ghép xài được, vì có tương hợp trong cell nào đó, here Numbr
SELECT * FROM VnDict vn, EnDict en
		 WHERE vn.Nmbr = en.Nmbr	--rút từ 3x3 = 9 xuống còn 3 
		 --GHÉP CÓ CHỌN LỌC KHI TÌM TƯƠNG QUAN CỘT/CELL ĐỂ GHÉP -> INNER JOIN/OUTER
								--EQUI JOIN
								--ĐA PHẦN THƯỜNG GHÉP THEO TOÁN TỬ = 
								--CÒN CÓ THỂ GHÉP THEO > >= < <= !=  



-------------------------------------------------------------------------------
SELECT * FROM VnDict, EnDict	--sinh ra 1 table mới số cột = tổng 2 bên, số dòng = tích 2 bên 
SELECT * FROM VnDict CROSS JOIN EnDict

SELECT * FROM VnDict, EnDict ORDER BY Nmbr
			--Ambiguous column name 'Nmbr'.
			--bối rối vì cả 2 bảng đều có cột tên là Nmbr 
SELECT * FROM VnDict, EnDict ORDER BY VnDict.Nmbr --tham chiếu cột qua tên table 
SELECT * FROM VnDict v, EnDict e ORDER BY v.Nmbr -- alias [AS] - đặt tên giả 
SELECT v.Nmbr, v.VnDesc, e.EnDesc FROM VnDict v, EnDict e ORDER BY v.Nmbr  
SELECT       v.*       , e.EnDesc FROM VnDict v, EnDict e ORDER BY v.Nmbr
SELECT v.*, e.EnDesc FROM VnDict v CROSS JOIN EnDict e ORDER BY E.Nmbr

SELECT * FROM VnDict v, EnDict e WHERE v.Nmbr = e.Nmbr --INNER JOIN, phần chung của 2 đứa 
SELECT * FROM VnDict v INNER JOIN EnDict e ON v.Nmbr = e.Nmbr
SELECT * FROM VnDict v    JOIN    EnDict e ON v.Nmbr = e.Nmbr



