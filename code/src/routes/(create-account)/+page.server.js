export const actions = {
    default: async ({ request: any }) => {
      const formData = await request.formData();
      const email = formData.post('email');
      // Process the form data and perform actions
      return { success: true };
    },
  };