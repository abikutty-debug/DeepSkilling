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