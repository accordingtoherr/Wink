
<script>
  import { onMount } from 'svelte';
  import { page } from '$app/stores'; // Import the page store

  let firstName = '';
  let lastName = '';
  let email = '';
  export let data;

  // onMount to extract query parameters when the page loads
  onMount(() => {
    const params = new URLSearchParams(window.location.search);
    firstName = params.get('firstName') || '';
    lastName = params.get('lastName') || '';
    email = params.get('email') || '';
  });

</script>

{JSON.stringify(data, null, 2)}