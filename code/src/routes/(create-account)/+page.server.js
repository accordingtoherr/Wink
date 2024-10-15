export const actions = {
	// @ts-ignore
	create: async ({ cookies, request }) => {
		const data = await request.formData();
		// @ts-ignore
		db.createTodo(cookies.get('userid'), data.get('description'));
	},

	// @ts-ignore
	delete: async ({ cookies, request }) => {
		const data = await request.formData();
		// @ts-ignore
		db.deleteTodo(cookies.get('userid'), data.get('id'));
	}
};