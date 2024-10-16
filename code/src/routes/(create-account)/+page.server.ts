import type { Actions } from './$types';
import { redirect } from '@sveltejs/kit';

export const actions: Actions = {
  // Handle form submission for the `/submit` endpoint
  submit: async ({ request }) => {
    console.log('Incoming request:', request);
    const data = await request.formData();

    const firstName = data.get('firstName')?.toString() || 'missing';
    const lastName = data.get('lastName')?.toString() || 'missing';
    const email = data.get('email')?.toString() || 'missing';

    // Log values to check if they are being extracted properly
    console.log('First Name:', firstName);
    console.log('Last Name:', lastName);
    console.log('Email:', email);

    // If any of the form fields are missing, log an error
    if (!firstName || !lastName || !email) {
      console.error('Error: Missing form fields');
      return { error: 'All fields are required!' };
    }
    // Create a JSON object from the form data
    const submittedData = { firstName, lastName, email };

   
    // Redirect to a new page (for example: `/member-account`) and pass the data
    throw redirect(303, `/member?firstName=${firstName}&lastName=${lastName}&email=${email}`);
  }

};

