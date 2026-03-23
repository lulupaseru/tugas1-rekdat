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

-- 8. Mahasiswa dengan IPK diatas rata-rata
SELECT *
FROM mahasiswa
WHERE IPK > (SELECT AVG(IPK) FROM mahasiswa);

-- 9

-- 10. banyaknya matkul yang diambil mhs
SELECT NPM, COUNT(KodeMK) AS banyak_matkul
FROM krs
GROUP BY NPM;
   
-- 11

-- 12. Nama mahasiswa dengan mata kuliah dengan SKS tertinggi
SELECT m.Nama
FROM mahasiswa m
JOIN krs k ON m.NPM = k.NPM
JOIN mata_kuliah mk ON k.KodeMK = mk.KodeMK
WHERE mk.SKS = (SELECT MAX(SKS) FROM mata_kuliah);

-- 13

-- 14. mhs dengan 3 sks   
SELECT m.Nama
FROM mahasiswa m, krs k, mata_kuliah mk
WHERE m.NPM = k.NPM 
	AND k.KodeMK = mk.KodeMK
GROUP BY m.NPM, m.Nama
	HAVING MIN(mk.SKS) = 3 AND MAX(mk.SKS) = 3;
   
-- 15

-- 16. Apakah mata kuliah dengan SKS lebih besar cenderung menghasilkan nilai lebih rendah?
SELECT mk.SKS AS Banyak_SKS, COUNT(*) AS Jumlah_Mata_Kuliah,
    AVG(
        CASE 
            WHEN k.Nilai = 'A' THEN 4.0
            WHEN k.Nilai = 'A-' THEN 3.67
            WHEN k.Nilai = 'B+' THEN 3.3
            WHEN k.Nilai = 'B' THEN 3.0
            WHEN k.Nilai = 'B-' THEN 2.67
            WHEN k.Nilai = 'C+' THEN 2.3
            WHEN k.Nilai = 'C' THEN 2.0
            WHEN k.Nilai = 'D' THEN 1.0
        END
    ) AS Rata_Nilai
FROM krs k
JOIN mata_kuliah mk ON k.KodeMK = mk.KodeMK
GROUP BY mk.SKS;

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

-- 20. Apakah terdapat perbedaan rata-rata IPK antar angkatan?
SELECT Angkatan, COUNT(*) AS Jumlah_Mahasiswa, AVG(IPK) AS Rata_IPK  
FROM mahasiswa  
GROUP BY Angkatan  
ORDER BY Angkatan;
