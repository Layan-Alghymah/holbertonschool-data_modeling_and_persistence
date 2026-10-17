SELECT c.title AS course_title
FROM courses c
INNER JOIN assignments a ON c.id = a.course_id
GROUP BY c.id, c.title
HAVING COUNT(*) > (
    SELECT AVG(assignment_count)
    FROM (
        SELECT COUNT(*) AS assignment_count
        FROM assignments
        GROUP BY course_id
    )
)
ORDER BY course_title ASC;
