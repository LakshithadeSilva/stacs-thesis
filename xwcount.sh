echo ---- Chapter totals ----
texcount -nosub -total -brief -opt=xwcount-opt.txt chap1/doc.tex
texcount -nosub -total -brief -opt=xwcount-opt.txt chap2/doc.tex
texcount -nosub -total -brief -opt=xwcount-opt.txt chap3/doc.tex
texcount -nosub -total -brief -opt=xwcount-opt.txt chap4/doc.tex

echo ---- Grand total ----
texcount -nosub -sum=1,1 -total -brief -opt=xwcount-opt.txt chap1/doc.tex chap2/doc.tex chap3/doc.tex chap4/doc.tex
