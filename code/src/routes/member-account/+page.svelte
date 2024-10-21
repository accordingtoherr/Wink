<script lang="ts">
	import { page } from '$app/stores';
	import SubscriptionTypes from '$lib/app/component/SubscriptionTypes.svelte';

	let firstName: string;
	let accountType: string;
	let accountOrigin: string;
	let lastName: string;
	let email: string;
	let job: string;
	let phone: string;
	let selectedCoDropdown: string;
	let companyState: string;
	let companyAddress: string;
	let companySuite: string;
	let companyZip: string;
	let companyCity: string;
	let companyName: string;
	let companyPhone: string;
	let companyUrl: string;
	let existingCoName: string;
  let subscriptionType: string;
  let subscriptionExpire: string;

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
    subscriptionType = params.get('selectedSub') || '';
    subscriptionExpire = params.get('selectedSubExpireDate') || '';
	}


</script>
<main class="container-fluid px-0 overflow-y-auto">
	<div class="" style="min-height: 100%; height: fit-content;">
		<div class="wk-p-4 wk-p-lg-8 w-100 wk-theme-surface-subtle wk-rounded-top-start-lg-3xl">
			<div
				class="form-Label fw-bold mb-2 d-flex flex-column flex-sm-row wk-gap-4 row wk-p-8 wk-pt-4 accordion wk-max-w-8xl wk-rounded-2xl wk-shadow-lg accordion"
			>
      <h2>Thank you for signing up!</h2>
      <hr>
				<h3>Member Information</h3>
				<p class="type"><strong>{accountType} Account</strong></p>
				<p>{firstName} {lastName}</p>
				<p>{email}</p>
				<p><strong>Phone:</strong> {phone}</p>
				{#if job}
					<p><strong>Job:</strong> {job}</p>
				{/if}
        <hr>
				<h3>Company Information</h3>
				{#if accountOrigin === 'existing'}
					<p>Existing Company</p>
					<p>{existingCoName}</p>
				{/if}
				{#if accountOrigin !== 'existing'}
					<p><strong></strong> {companyName}</p>
					<p><strong>Address:</strong> {companyAddress}</p>

					<p><strong>Phone:</strong> {companyPhone}</p>
					<p><strong>Address:</strong> {companyPhone}</p>
					{#if companySuite !== ''}
						<p><strong>Suite:</strong> {companySuite}</p>
					{/if}
					<p><strong>City:</strong> {companyCity}</p>
					<p><strong>State:</strong> {companyState}</p>
					{#if companyZip}
						<p><strong>Zip:</strong> {companyZip}</p>
					{/if}
				{/if}
        <hr>
        <h3>Subscription and Billing Information</h3>
        <p><strong>Subscription Type:</strong> {subscriptionType}</p>
        <p>Expiring on {subscriptionExpire}</p>
			</div>
		</div>
	</div>
</main>

<style>
	.type {
		text-transform: capitalize;
	}

  h2 {
    text-align: center;
    color: #5d5ba0;
  }


  
</style>
