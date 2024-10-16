
<script>
  import { onMount } from 'svelte';
  import { page } from '$app/stores'; // Import the page store

  let firstName = '';
  let lastName = '';
  let email = '';

  // onMount to extract query parameters when the page loads
  onMount(() => {
    const params = new URLSearchParams(window.location.search);
    firstName = params.get('firstName') || '';
    lastName = params.get('lastName') || '';
    email = params.get('email') || '';
  });

</script>

<h1>Member Account</h1>
<p><strong>First Name:</strong> {firstName}</p>
<p><strong>Last Name:</strong> {lastName}</p>
<p><strong>Email:</strong> {email}</p>