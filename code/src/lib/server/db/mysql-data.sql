-- Insert data into departments
INSERT INTO departments (name, location) VALUES 
('Engineering', 'New York'),
('Human Resources', 'San Francisco'),
('Finance', 'Chicago'),
('Marketing', 'Los Angeles'),
('Operations', 'Boston');

-- Insert data into employees
INSERT INTO employees (first_name, last_name, email, hire_date, salary, department_id) VALUES
('John', 'Doe', 'johndoe@example.com', '2020-01-15', 80000.00, 1), -- Engineering
('Jane', 'Smith', 'janesmith@example.com', '2019-06-30', 95000.00, 1), -- Engineering
('Michael', 'Johnson', 'michaelj@example.com', '2018-03-12', 70000.00, NULL), -- No department
('Sarah', 'Connor', 'sarahc@example.com', '2021-09-10', 85000.00, 2), -- HR
('Emily', 'Davis', 'emilyd@example.com', '2017-11-25', 78000.00, 3), -- Finance
('David', 'Miller', 'davidm@example.com', '2020-07-22', 110000.00, NULL), -- No department
('Sophia', 'Wilson', 'sophiaw@example.com', '2021-05-14', 120000.00, 1), -- Engineering
('Chris', 'Evans', 'chrise@example.com', '2019-04-20', 62000.00, 4); -- Marketing

-- Insert data into projects
INSERT INTO projects (name, start_date, end_date, budget, department_id) VALUES
('Project Alpha', '2020-01-01', '2021-01-01', 500000.00, 1), -- Engineering
('Project Beta', '2019-03-01', NULL, 300000.00, 1), -- Engineering
('Project Gamma', '2021-07-01', NULL, 200000.00, 2), -- HR
('Project Delta', '2018-05-01', '2019-05-01', 150000.00, 3), -- Finance
('Project Epsilon', '2020-09-01', NULL, 400000.00, 4); -- Marketing

-- Insert data into employee_projects
INSERT INTO employee_projects (employee_id, project_id) VALUES
(1, 1), -- John Doe on Project Alpha
(1, 2), -- John Doe on Project Beta
(2, 1), -- Jane Smith on Project Alpha
(2, 2), -- Jane Smith on Project Beta
(4, 3), -- Sarah Connor on Project Gamma
(5, 4), -- Emily Davis on Project Delta
(7, 1), -- Sophia Wilson on Project Alpha
(8, 5); -- Chris Evans on Project Epsilon
