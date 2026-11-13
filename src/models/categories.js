import db from './db.js'

const getAllCategories = async() => {
    const query = `
        SELECT category_id, name
        FROM public.category;
    `;

    const result = await db.query(query);

    return result.rows;
}

const getCategoryById = async (id) => {
    const query = `
        SELECT category_id, name
        FROM public.category
        WHERE category_id = $1;
    `;

    const queryParams = [id];
    const result = await db.query(query, queryParams);

    return result.rows[0];
}

const getCategoriesByProjectId = async (projectId) => {
    const query = `
        SELECT category.category_id, category.name
        FROM public.category
        JOIN public.project_category
          ON category.category_id = project_category.category_id
        WHERE project_category.project_id = $1
        ORDER BY category.name;
    `;

    const queryParams = [projectId];
    const result = await db.query(query, queryParams);

    return result.rows;
}

const getProjectsByCategoryId = async (categoryId) => {
    const query = `
        SELECT project.project_id, project.title, project.description,
               project.location, project.project_date
        FROM public.project
        JOIN public.project_category
          ON project.project_id = project_category.project_id
        WHERE project_category.category_id = $1
        ORDER BY project.project_date;
    `;

    const queryParams = [categoryId];
    const result = await db.query(query, queryParams);

    return result.rows;
}

export { getAllCategories, getCategoryById, getCategoriesByProjectId, getProjectsByCategoryId };