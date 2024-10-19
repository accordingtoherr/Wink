SELECT d.name AS department_name, SUM(p.budget) AS total_budget
FROM departments d
JOIN projects p ON d.id = p.department_id
GROUP BY d.name;