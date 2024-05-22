SELECT sps.School.name AS SchoolName, sps.Education.name AS EducationName, sps.Disability.name as DisabilityName, COUNT(DISTINCT sps.Student.id) AS EntriesCount
FROM sps.`Case`
LEFT JOIN sps.Student ON sps.`Case`.studentID = sps.Student.id
LEFT JOIN sps.School ON sps.Student.schoolID = School.id
LEFT JOIN sps.Education ON sps.Student.educationID = Education.id
left JOIN sps.Disability on `Case`.disabilityID = Disability.id
WHERE YEAR(sps.`Case`.supportStart) = 2023 and (sps.`Case`.spsaId is not null or sps.`Case`.externalCaseID is not null)
GROUP BY School.name, Education.name
ORDER BY School.name, Education.name;