import type { Actions } from './$types';

export const actions: Actions = {
  default: async ({ request }) => {
    // Check the content type of the request
    const contentType = request.headers.get('content-type');

    if (contentType && contentType.includes('application/x-www-form-urlencoded')) {
      // Handle form-encoded data
      const formData = await request.formData();
      console.log('f', formData)
      const name = formData.get('memberFirstName');
      const email = formData.get('email');


      return {
        success: true,
        data: { name: name, email }
      };
    } else if (contentType && contentType.includes('application/json')) {
      // Handle JSON data
      const data = await request.json();
      return {
        success: true,
        data
      };
    } else {
      return {
        success: false,
        error: 'Unsupported content type'
      };
    }
  }
};
