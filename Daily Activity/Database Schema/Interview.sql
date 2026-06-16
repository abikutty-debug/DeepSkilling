CREATE DATABASE CandidateManagement;
USE CandidateManagement;
CREATE TABLE Candidate (
    candidate_id INT PRIMARY KEY AUTO_INCREMENT,
    candidate_name VARCHAR(100) NOT NULL,
    college VARCHAR(100),
    cgpa DECIMAL(3,2) CHECK (cgpa BETWEEN 0 AND 10)
);
INSERT INTO Candidate(candidate_name, college, cgpa)
VALUES
('Abi', 'XYZ Engineering College', 8.75),
('Kavin', 'ABC College', 9.10),
('Priya', 'SRM University', 8.50);
CREATE TABLE Interviewer (
    interviewer_id INT PRIMARY KEY AUTO_INCREMENT,
    interviewer_name VARCHAR(100) NOT NULL
);
INSERT INTO Interviewer(interviewer_name)
VALUES
('Mr. Smith'),
('Ms. Johnson'),
('Dr. Brown');
CREATE TABLE Assessment (
    assessment_id INT PRIMARY KEY AUTO_INCREMENT,
    candidate_id INT,
    assessment_type VARCHAR(20),
    score INT CHECK(score BETWEEN 1 AND 10),
    assessment_date DATE,
    
    FOREIGN KEY(candidate_id)
    REFERENCES Candidate(candidate_id)
);
INSERT INTO Assessment
(candidate_id, assessment_type, score, assessment_date)
VALUES
(1,'DSA',9,'2026-06-01'),
(1,'Aptitude',8,'2026-06-02'),
(2,'DSA',10,'2026-06-01'),
(3,'Aptitude',7,'2026-06-03');
CREATE TABLE Interview (
    interview_id INT PRIMARY KEY AUTO_INCREMENT,
    candidate_id INT,
    interviewer_id INT,
    interview_date DATE,
    status VARCHAR(20)
        CHECK(status IN
        ('Scheduled','Completed','Selected','Rejected')),
    
    FOREIGN KEY(candidate_id)
    REFERENCES Candidate(candidate_id),
    
    FOREIGN KEY(interviewer_id)
    REFERENCES Interviewer(interviewer_id)
);
INSERT INTO Interview
(candidate_id, interviewer_id, interview_date, status)
VALUES
(1,1,'2026-06-20','Scheduled'),
(2,2,'2026-06-21','Completed'),
(3,3,'2026-06-22','Selected');
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