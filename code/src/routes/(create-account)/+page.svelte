<script lang="ts">
	import { goto } from '$app/navigation'; 
	import BoxedRadio from '$lib/app/component/BoxedRadio.svelte';
	import SubscriptionTypes from '$lib/app/component/SubscriptionTypes.svelte';
	import { Accordion, AccordionItem, Input, Label } from '@sveltestrap/sveltestrap';
	import Dropdown from '$lib/app/component/Dropdown.svelte';

	
	const emailRegex = /^\S+@\S+\.\S+$/;
	const isValidZip = /(^\d{5}$)|(^\d{5}-\d{4}$)/;
	const isValidPhone =/^(1\s?)?(\d{3}|\(\d{3}\))[\s\-]?\d{3}[\s\-]?\d{4}$/gm;

	let selectedItemDropdown: string | undefined;
	let selectedAccount: string | undefined;
	let selected: string | undefined;
	let firstNameError: string;
	let lastNameError: string;
	let emailError: string;
	let companyNameError: string;
	let zipCodeError: string;
	let phoneError: string;
	let toggledYesValues: string[] = [];
	let toggledValue: string;



	let formData = {
		accountType: '',
		accountOrigin: '',
		selectedSub: toggledYesValues.join(''),
		selectedSubExpireDate:'',
		firstName: '',
		lastName: '',
		email: '',
		phone: '',
		job: '',
		existingCoName: '',
		companyName: '',
		companyPhone: '',
		companyAddress: '',
		companySuite: '',
		companyUrl: '',
		companyCity: '',
		companyState: '',
		companyZip: ''
	};

	let errors = {
		firstName: '',
		lastName: '',
		email: '',
		phone: '',
		zip: '',
		companyName: ''
	};

	// Reactive validation logic
	$: errors.firstName =
		formData.firstName.length < 2 ? 'First name must be at least 2 characters long.' : '';
	$: errors.lastName =
		formData.lastName.length < 2 ? 'Last name must be at least 2 characters long.' : '';
	$: errors.email = !emailRegex.test(formData.email) ? 'Must enter a valid email address.' : '';
	$: errors.phone = !isValidPhone.test(formData.phone) ? 'Must enter a valid phone number.' : '';
	$: errors.companyName = formData.companyName.length > 0 ? 'Must enter a Company Name' : '';
	$: errors.zip =!isValidZip.test(formData.companyZip) ? 'Must enter a valid US zipcode.' : ''; 
	// Check if the form is valid
	$: isFormValid = !errors.firstName && !errors.lastName && !errors.email;

	

// Handle the event when the parent notifies that the toggle was set to "Yes"
function handleToggledYes(event: any) {
  const { name } = event.detail;
  // Add the name to the list if it was toggled to Yes
  if (!toggledYesValues.includes(name)) {
	toggledYesValues = [name]; // Only one can be toggled
	formData.selectedSub = event.detail.name;
	formData.selectedSubExpireDate = event.detail.date;

  }
}
  // Add the item name to the list if toggled to Yes


	async function handleSubmit(event: any) {
		event.preventDefault();
		if (isFormValid === true) {
			const queryParams = new URLSearchParams(formData).toString()
			console.log('q', queryParams)
			await goto(`/member-account?${queryParams}`);
		} else {
			//set errors only on submit for a better UX//
			firstNameError = errors.firstName;
			lastNameError = errors.lastName;
			emailError = errors.email;
			companyNameError = errors.companyName;
			zipCodeError = errors.zip;
			phoneError = errors.phone;
			//log errors if form is not valid//
			console.log(event.errors);
		}
	}
</script>

<main class="container-fluid px-0 overflow-y-auto">
	<div
		class="d-flex w-100 mb-0 wk-pe-0 wk-ps-0 wk-ps-lg-8 wk-pt-0 wk-pt-lg-4"
		style="min-height: 100%; height: fit-content;"
	>
		<div class="wk-p-4 wk-p-lg-8 w-100 wk-shadow-lg  wk-theme-surface-subtle wk-rounded-top-start-lg-3xl">
			<div class="d-flex flex-column align-items-start">
				<h1 class="wk-fs-3xl">Create Account</h1>
				<p class="subtitle">
					Create new member account or add member to existing corporate accounts.
				</p>
				<form on:submit={handleSubmit} class="vstack wk-gap-4 wk-gap-lg-8 needs-validation">
					<!-- account settings -->
					<Accordion stayOpen class="accordion wk-max-w-8xl wk-rounded-2xl wk-shadow-lg">
						<AccordionItem active header="Account Settings">
							<div class="row wk-p-8 wk-pt-4">
								<div class="col-12 col-xl-3 d-none d-lg-block"></div>
								<div id="accountSettingsCollapse" class="col-12 col-xl-9">
									<div class="row wk-pb-4">
										<Label for="accountType" class="form-Label fw-bold mb-2"
											>Choose Account Type</Label
										>

										<div class="d-flex flex-column flex-sm-row wk-gap-4">
											<BoxedRadio
												companyType=""
												id="accountTypeCorporate"
												name="accountType"
												value="corporate"
												selected
												bind:selectedAccount={formData.accountType}
												flexGrow>Corporate</BoxedRadio
											>
											<BoxedRadio
												companyType=""
												bind:selectedAccount={formData.accountType}
												id="accountTypeAgent"
												name="accountType"
												selected
												value="agent"
												flexGrow>Agent</BoxedRadio
											>

											<BoxedRadio
												companyType=""
												id="accountTypeAppService"
												name="accountType"
												selected
												bind:selectedAccount={formData.accountType}
												value="application service"
												flexGrow>Application Service</BoxedRadio
											>
										</div>
									</div>
									<div class="row">
										{#if formData.accountType !== 'agent'}
											<Label for="accountCreateType" class="form-Label fw-bold mb-2"
												>New Member Account Origin</Label
											>
											<div class="d-flex flex-column flex-sm-row wk-gap-4">
												<BoxedRadio
													id="accountCreateNew"
													name="accountCreateType"
													value="new company"
													selectedAccount=""
													selected
													bind:companyType={formData.accountOrigin}
													flexGrow>New Company</BoxedRadio
												>

												<BoxedRadio
													id="accountCreateExisting"
													name="accountCreateType"
													value="existing"
													selected
													bind:companyType={formData.accountOrigin}
													selectedAccount=""
													flexGrow>Existing Company</BoxedRadio
												>
											</div>
										{/if}
									</div>
								</div>
							</div>
						</AccordionItem>
					</Accordion>
					<!-- company information -->
					<Accordion stayOpen class="accordion wk-max-w-8xl wk-rounded-2xl wk-shadow-lg">
						<AccordionItem active header="Company Information">
							{#if !isFormValid && companyNameError !== undefined}
								<p class={errors.companyName ? 'alert alert-danger' : ''}>{companyNameError}</p>
							{/if}
							{#if !isFormValid && zipCodeError !== undefined}
							<p class={errors.zip? 'alert alert-danger' : ''}>{zipCodeError}</p>
						   {/if}
							<div class="row wk-p-8 wk-pt-4">
								<div class=" col-12 col-xl-3 d-none d-lg-block"></div>
								{#if formData.accountOrigin !== 'existing'}
									<div id="companyInformationCollapse" class="col-12 col-xl-9">
										<div class="wk-pb-4">
											<Label for="companyName" class="form-Label fw-bold mb-2">
												<span class={formData.accountType === 'corporate' || formData.accountType === 'application service'? 'required' : 'not-required'}>
													*
												</span>Company Name
											</Label>
											<Input
												bind:value={formData.companyName}
												id="companyName"
												type="text"
												required={formData.accountType === 'agent' ? false : true}
												name="companyName"
												class="form-control"
											/>
										</div>
										<div class="row wk-pb-4">
											<div class="col-12 col-md-6">
												<Label for="companyPhoneNumber" class="form-Label fw-bold mb-2"
													>Company Phone Number</Label
												>
												<Input
													id="companyPhoneNumber"
													type="tel"
													name="companyPhoneNumber"
													class="form-control"
													bind:value={formData.companyPhone}
												/>
											</div>
											<div class="col-12 col-md-6">
												<Label for="companyWebsiteUrl" class="form-Label fw-bold mb-2"
													>Company Website</Label
												>
												<Input
													id="companyWebsiteUrl"
													type="url"
													name="companyWebsiteUrl"
													class="form-control"
													bind:value={formData.companyUrl}
												/>
											</div>
										</div>
										<div id="companyAddress">
											<div class="wk-pb-4">
												<Label for="companyStreetAddress" class="form-Label fw-bold mb-2"
													>Street Address</Label
												>
												<Input
													id="companyStreetAddress"
													type="text"
													name="companyStreetAddress"
													class="form-control"
													bind:value={formData.companyAddress}
												/>
											</div>
											<div class="wk-pb-4">
												<Label for="companySuite" class="form-Label fw-bold mb-2"
													>Suite, Floor, etc. (optional)</Label
												>
												<Input
													id="companySuite"
													type="text"
													name="companySuite"
													class="form-control"
													bind:value={formData.companySuite}
												/>
											</div>

											<div class="row">
												<div class="col-12 col-md-6 wk-pb-4 wk-pb-md-0">
													<Label for="companyCity" class="form-Label fw-bold mb-2">City</Label>
													<Input
														id="companyCity"
														type="text"
														name="companyCity"
														class="form-control"
														bind:value={formData.companyCity}
													/>
												</div>
												<div class="col-8 col-md-2 wk-pb-4 wk-pb-md-0">
													<Label for="companyState" class="form-Label fw-bold mb-2">State</Label>
													<Input bind:value={formData.companyState} type="select">
														{#each ['AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VA', 'VT', 'WA', 'WI', 'WV', 'WY'] as option}
															<option>{option}</option>
														{/each}
													</Input>
												</div>
												<div class="col-8 col-md-4 wk-pb-md-0">
													<Label for="companyZip" class="form-Label fw-bold mb-2">Zip Code</Label>
													<Input
														bind:value={formData.companyZip}
														id="companyZip"
														type="text"
														name="companyZip"
														class="form-control"
													/>
												</div>
											</div>
										</div>
									</div>
								{/if}
								{#if formData.accountOrigin === 'existing'}
									<Label for="existingCompany" class="form-Label fw-bold mb-2 dropdown"
										>*Select Existing Company</Label
									><Dropdown {selectedItemDropdown} bind:value={formData.existingCoName} />
								{/if}
							</div>
						</AccordionItem>
					</Accordion>
					<!-- member information -->
					<Accordion stayOpen class="accordion wk-max-w-8xl wk-rounded-2xl wk-shadow-lg">
						<AccordionItem active header="Member Information">
							{#if !isFormValid && firstNameError}
								<p class={errors.firstName ? 'alert alert-danger' : ''}>{firstNameError}</p>
							{/if}
							{#if !isFormValid && lastNameError !== undefined}
								<p class={errors.lastName ? 'alert alert-danger' : ''}>{lastNameError}</p>
							{/if}
							{#if !isFormValid && emailError !== undefined}
								<p class={errors.email ? 'alert alert-danger' : ''}>{emailError}</p>
							{/if}
							{#if !isFormValid && phoneError!== undefined}
							<p class={errors.phone ? 'alert alert-danger' : ''}>{phoneError}</p>
						   {/if}
							<div class="row wk-p-8 wk-pt-4">
								<div class=" col-12 col-xl-3 d-none d-lg-block"></div>
								<div class="col-12 col-xl-9">
									<div class="row wk-pb-4">
										<div class="col-12 col-md-6 wk-pb-4 wk-pb-md-0">
											<Label for="memberFirstName" class="form-Label fw-bold mb-2"
												>*First Name</Label
											>
											<Input
												id={errors.firstName ? 'error-outline' : 'memberFirstName'}
												type="text"
												name="memberFirstName"
												class="form-control"
												bind:value={formData.firstName}
											/>
										</div>
										<div class="col-12 col-md-6">
											<Label for="memberLastName" class="form-Label fw-bold mb-2">*Last Name</Label>
											<Input
												id={errors.firstName !== '' ? 'error-outline' : 'memberLastName'}
												type="text"
												name="memberLastName"
												class="form-control"
												bind:value={formData.lastName}
											/>
										</div>
									</div>
									<div class="row wk-pb-4">
										<div class="col-12 col-md-6 wk-pb-4 wk-pb-md-0">
											<Label for="memberEmail" class="form-Label fw-bold mb-2">*Email</Label>
											<Input
												id={errors.firstName !== '' ? 'error-outline' : 'memberEmail'}
												type="text"
												name="memberEmail"
												class="form-control"
												bind:value={formData.email}
											/>
										</div>
										<div class="col-12 col-md-6">
											<Label for="jobTitle" class="form-Label fw-bold mb-2">Job Title</Label>
											<Input
												bind:value={formData.job}
												id="jobTitle"
												type="text"
												name="jobTitle"
												class="form-control"
											/>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-6">
											<Label for="memberPhoneNumber" class="form-Label fw-bold mb-2"
												>Phone Number</Label
											>
											<Input
												id="memberPhoneNumber"
												type="tel"
												bind:value={formData.phone}
												name="memberPhoneNumber"
												class="form-control"
											/>
										</div>
										<div class="col-8 col-md-3">
											<Label for="memberPhoneExt" class="form-Label fw-bold mb-2">Extension</Label>
											<Input
												id="memberPhoneExt"
												type="text"
												name="memberPhoneExt"
												class="form-control"
											/>
										</div>
									</div>
								</div>
							</div>
						</AccordionItem>
					</Accordion>
					<!-- Subscription/Billing -->
					<Accordion stayOpen class="accordion wk-max-w-8xl wk-rounded-2xl wk-shadow-lg">
						<AccordionItem active header="Subscription/Billing">
			
							<div class=" sub-wrapper wk-p-4 wk-p-lg-6 w-100 wk-theme-surface-subtle wk-rounded-top-start-lg-3xl accordion wk-max-w-8xl wk-rounded-2xl wk-shadow-lg accordion">

								<SubscriptionTypes
								value={formData.selectedSub} 
								name={formData.selectedSub} 
								on:toggledYes={handleToggledYes}  />
							</div>
						</AccordionItem>
					</Accordion>	 

					<div>
						<button id="submitCreateAccountBtn" type="submit" class="btn btn-lg wk-btn-theme"
							>Submit</button
						>
					</div>
				</form>
			</div>
		</div>
	</div>
</main>

<style lang="scss">
	@use '../../scss/base/colors' as *;
	//SvelteStrap Overrides
	div :global(.accordion) {
		--bs-accordion-border-radius: 1.25rem;
		--bs-accordion-inner-border-radius: calc(1.25rem -(var(--bs-border-width)));
		--bs-accordion-active-bg: transparent;
	}
	input#error-outline {
		border: 1px solid red !important;
	}

	div :global(.accordion-button) {
		font-weight: 800;
		font-size: 1.25rem !important; //20px;
		color: var(--neutral-text-title) !important;
		font-family: var(--bs-body-font-family);
	}
	label.form-Label.fw-bold.mb-2.color.form-label {
	color: #5D5BA0;
}

	label.dropdown {
		padding-left: 0;
	}

	p.error {
		display: none;
	}

	span.not-required {
		visibility: hidden;
	}

	span.required {
		visibility: visible;
	}

	p.error:focus {
		display: block;
	}

	.sub-wrapper {
		display: flex;
		justify-content: space-around;
	}
</style>
