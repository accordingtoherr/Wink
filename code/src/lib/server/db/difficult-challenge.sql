SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN employee_projects ep ON e.id = ep.employee_id
GROUP BY e.id, e.first_name, e.last_name, e.salary
ORDER BY e.salary DESC
LIMIT 3;