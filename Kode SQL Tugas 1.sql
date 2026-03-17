CREATE DATABASE universitas;
USE universitas;

-- 1

-- 2. null pada dataset
SELECT * 
FROM mahasiswa
WHERE NPM IS NULL 
   OR Nama IS NULL 
   OR Angkatan IS NULL 
   OR Prodi IS NULL 
   OR IPK IS NULL;
   
SELECT * 
FROM dosen
WHERE NIDN IS NULL 
   OR NamaDosen IS NULL 
   OR Prodi IS NULL;
   
SELECT * 
FROM mata_kuliah
WHERE KodeMK IS NULL 
   OR NamaMK IS NULL 
   OR SKS IS NULL 
   OR Prodi IS NULL;
   
SELECT *
FROM krs
WHERE NPM IS NULL 
   OR KodeMK IS NULL 
   OR Semester IS NULL 
   OR Nilai IS NULL;
   
-- 3

-- 4

-- 5

-- 6. avg, min, max, std
SELECT 
	AVG(IPK) AS avg_IPK,
    MIN(IPK) AS min_IPK,
    MAX(IPK) AS max_ipk,
    STDDEV(IPK) AS std_IPK
FROM mahasiswa;

SELECT	
	AVG(SKS) AS avg_SKS,
    MIN(SKS) AS min_SKS,
    MAX(SKS) AS max_SKS,
    STDDEV(SKS) AS std_SKS
FROM mata_kuliah;
   
SELECT
	AVG(Semester) AS avg_semester,
    MIN(Semester) AS min_semester,
    MAX(Semester) AS max_semester,
    STDDEV(Semester) AS std_semester
FROM krs;
   
-- 7

-- 8

-- 9

-- 10. banyaknya matkul yang diambil mhs
SELECT NPM, COUNT(KodeMK) AS banyak_matkul
FROM krs
GROUP BY NPM;
   
-- 11

-- 12

-- 13

-- 14. mhs dengan 3 sks   
SELECT m.Nama
FROM mahasiswa m, krs k, mata_kuliah mk
WHERE m.NPM = k.NPM 
	AND k.KodeMK = mk.KodeMK
GROUP BY m.NPM, m.Nama
	HAVING MIN(mk.SKS) = 3 AND MAX(mk.SKS) = 3;
   
-- 15

-- 16

-- 17

-- 18
SELECT 
    COUNT(DISTINCT CASE WHEN m.Prodi != mk.Prodi THEN m.NPM END) * 1.0 
    / 
    COUNT(DISTINCT m.NPM) AS Proporsi_Lintas_Prodi
FROM mahasiswa m, krs k, mata_kuliah mk
WHERE m.NPM = k.NPM 
  AND k.KodeMK = mk.KodeMK;

-- 19

-- 20
   