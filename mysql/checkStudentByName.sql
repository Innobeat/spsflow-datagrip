SET @search_pattern = '';

WITH MatchingStudents AS (
    SELECT id, CONCAT(fname, ' ', lname) AS full_name, ssn
    FROM Student
    WHERE (
        CONCAT(fname, ' ', lname) LIKE CONCAT('%', @search_pattern, '%') OR
        ssn LIKE CONCAT('%', @search_pattern, '%')
    )
    OR (
        CONCAT(fname, ' ', lname) LIKE CONCAT('%', SUBSTRING_INDEX(@search_pattern, ' ', 1), '%')
        AND
        CONCAT(fname, ' ', lname) LIKE CONCAT('%', SUBSTRING_INDEX(@search_pattern, ' ', -1), '%')
    )
)
SELECT
    c.id as spsFlowCaseId,
    c.studentId as spsFlowCaseStudentId,
    c.spsaId as caseSpsaId,
    s.id as spsFlowStudentId,
    s.full_name,
    s.ssn,
    sa.spsApplicationId as spsaSpsaId,
    sa.status as spsaStatus,
    sgi.produktNavn as spsaProduktNavn,
    sgi.antalEnheder as spsaAntalEnheder,
    sgi.stoetteStartdato as spsaStoetteStartdato,
    sgi.stoetteSlutdato as spsaStoetteSlutdato
FROM MatchingStudents s
LEFT JOIN `Case` c ON s.id = c.studentId
LEFT JOIN SpsaApplication sa ON LOWER(s.full_name) = LOWER(sa.eleverStuderende)
LEFT JOIN SpsaGrantItem sgi ON sa.spsApplicationId = sgi.spsApplicationId
order by s.full_name;