USE empresa

-- Consulta da quantidade de projetos que não possuem usuários associados

SELECT COUNT(pr.id) AS qty_projects_no_users
FROM projects pr LEFT OUTER JOIN users_has_projects up
	ON pr.id = up.projects_id
WHERE up.users_id IS NULL


-- Consulta do ID, nome e quantidade de usuários associados a cada projeto,
-- ordenada em ordem alfabética crescente pelo nome do projeto

SELECT 
	pr.id,
	pr.name,
	COUNT(up.users_id) AS qty_users_project
FROM projects pr LEFT OUTER JOIN users_has_projects up
ON pr.id = up.projects_id
GROUP BY pr.id, pr.name
ORDER BY pr.name ASC