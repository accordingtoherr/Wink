<script>
  import { page } from '$app/stores';

  let firstName, accountType, lastName, email, phone, job, selectedCoDropdown,
   companyAddress, companySuite, companyZip, companyCity, companyState, companyName, companyPhone, companyUrl, accountOrigin, existingCoName

  // Subscribe to page store to get the query parameters
  $: {
    const params = new URLSearchParams($page.url.search);

    firstName = params.get('firstName') || '';
    lastName = params.get('lastName') || '';
    email = params.get('email') || '';
    phone = params.get('phone') || '';
    job = params.get('job') || '';
    companyName = params.get('companyName') || '';
    companyUrl = params.get('companyUrl') || '';
    companyPhone = params.get('companyPhone') || '';
    companyAddress = params.get('companyAddress') || '';
    companySuite = params.get('companySuite') || '';
    companyCity = params.get('companyCity') || '';
    companyState = params.get('companyState') || '';
    accountType = params.get('accountType') || '';
    accountOrigin = params.get('accountOrigin') || '';
    existingCoName = params.get('existingCoName') || '';
  }


</script>
<main class="container-fluid px-0 overflow-y-auto">
	<div
		class=""
		style="min-height: 100%; height: fit-content;"
	>
  <div class="wk-p-4 wk-p-lg-8 w-100 wk-theme-surface-subtle wk-rounded-top-start-lg-3xl">
   <div class="form-Label fw-bold mb-2 d-flex flex-column flex-sm-row wk-gap-4 row wk-p-8 wk-pt-4 accordion wk-max-w-8xl wk-rounded-2xl wk-shadow-lg accordion">

 <h2>Member Information</h2>
 <p class='type'><strong>Type of Account:</strong> {accountType}</p>
 <p><strong>Member Account Origin</strong> {accountOrigin}</p>
  <p><strong>First Name:</strong> {firstName}</p>
  <p><strong>Last Name:</strong> {lastName}</p>
  <p><strong>Email:</strong> {email}</p>
  <p><strong>Phone:</strong> {phone}</p>
  <p><strong>Job:</strong> {job}</p>
 
</div>

</div>
<div class="wk-p-4 wk-p-lg-8 w-100 wk-theme-surface-subtle wk-rounded-top-start-lg-3xl">
  <div class="form-Label fw-bold mb-2 d-flex flex-column flex-sm-row wk-gap-4 row wk-p-8 wk-pt-4 accordion wk-max-w-8xl wk-rounded-2xl wk-shadow-lg accordion">

<h2>Company Information</h2>
 {#if accountOrigin === 'existing'}
 <p><strong>Existing Company Name:</strong> {existingCoName}</p>
 {/if}
 {#if accountOrigin !== 'existing'}
 <p><strong>Name:</strong> {companyName}</p>
 <p><strong>Address:</strong> {companyAddress}</p>

 <p><strong>Phone:</strong> {companyPhone}</p>
 <p><strong>Address:</strong> {companyPhone}</p>
 {#if companySuite !== ''}
 <p><strong>Suite:</strong> {companySuite}</p>
 {/if}
 <p><strong>City:</strong> {companyCity}</p>
 <p><strong>State:</strong> {companyState}</p>
 <p><strong>Zip:</strong> {companyZip}</p>
{/if}
</div>

</div>

</div>
</main>

<style>
  .type {
    text-transform: capitalize;
  }
</style>