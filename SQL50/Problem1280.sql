WITH JOINER AS (
    SELECT
        *
    FROM
        STUDENTS CROSS
        JOIN SUBJECTS
)
SELECT
    STUDENT_ID,
    STUDENT_NAME,
    SUBJECT_NAME,
    COUNT(*)       AS ATTENDED_EXAMS
FROM
    EXAMINATIONS
    NATURAL JOIN STUDENTS
GROUP BY
    STUDENT_ID,
    STUDENT_NAME,
    SUBJECT_NAME
UNION
SELECT
    J.STUDENT_ID,
    J.STUDENT_NAME,
    J.SUBJECT_NAME,
    0 AS ATTENDED_EXAMS
FROM
    JOINER       J
    LEFT JOIN EXAMINATIONS E
    ON J.STUDENT_ID = E.STUDENT_ID
    AND J.SUBJECT_NAME = E.SUBJECT_NAME
WHERE
    E.STUDENT_ID IS NULL;