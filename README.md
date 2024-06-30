
סקריפט לבדיקת פלינדרום
סקריפט זה (script.sh) בודק אם מחרוזת הקלט שניתנת היא פלינדרום. הסקריפט כולל אימות לוודא שהקלט הוא מחרוזת ולא מספר.

שימוש
דרישות
Bash (Bourne Again SHell)
Git (לשם הורדת המאגר)
הוראות
הורדת המאגר:

bash
Copy code
git clone https://github.com/osll1/Linux.git
cd Linux
הרצת הסקריפט:

bash
Copy code
bash script.sh <מחרוזת_קלט>
החלף <מחרוזת_קלט> במחרוזת שברצונך לבדוק.

דוגמאות
קלט חוקי (פלינדרום)
bash
Copy code
bash script.sh "שלום"
פלט:

arduino
Copy code
המחרוזת 'שלום' אינה פלינדרום.
קלט לא חוקי (מספרי)
bash
Copy code
bash script.sh "12321"
פלט:

makefile
Copy code
שגיאה: זוהתה קלט מספרי. יש להזין מחרוזת.
פרטי הסקריפט
הסקריפט script.sh:

מקבל קלט מחרוזת מהשורת פקודה.
בודק אם הקלט ריק או מספרי.
מגדיר אם המחרוזת קוראת אותו הדבר בכיוון קדימה ואחורה (פלינדרום).
מדפיס את התוצאה כטקסט ויוצר קובץ HTML (palindrome_result.html) עם התוצאה.
