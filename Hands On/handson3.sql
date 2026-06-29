USE CandidateManagement;
SELECT
    c.candidate_id,
    c.candidate_name,
    c.cgpa,
    AVG(a.score) AS average_score
FROM Candidate c
LEFT JOIN Assessment a
ON c.candidate_id = a.candidate_id
GROUP BY
    c.candidate_id,
    c.candidate_name,
    c.cgpa
ORDER BY c.cgpa DESC;