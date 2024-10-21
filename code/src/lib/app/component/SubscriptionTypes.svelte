<script lang="ts">
	import { Input, Label } from '@sveltestrap/sveltestrap';
	import Toggle from './Toggle.svelte';
	import { createEventDispatcher } from 'svelte';

	export let name: string;
	export let value: boolean | string | undefined;
	export let group: string | number | undefined = undefined;
	export let checked: boolean = false;

	$: checked = group !== undefined ? group === value : checked;

	const dispatch = createEventDispatcher<{ toggledYes: { name: string; date: string } }>();
	//use Date obj to grab current date and format, since a user would be a new user getting a subscription that should start when they purchase/sign up//
	let date = new Date().toLocaleString('en-us', {
		day: 'numeric',
		month: 'short',
		year: 'numeric'
	});

	let items = [
		{ id: 1, name: 'AnnuitySpecs', isToggled: false },
		{ id: 2, name: 'LifeSpecs', isToggled: false },
		{ id: 3, name: 'Sales & Market Report', isToggled: false },
		{ id: 4, name: 'Index Intelligence Report', isToggled: false }
	];

	function handleToggleChanged(index: number, isToggled: boolean, date: string) {
		items = items.map((item, i) => ({
			...item,
			isToggled: i === index ? isToggled : false
		}));

		if (isToggled) {
			dispatch('toggledYes', { name: items[index].name, date: date });
		}
	}
</script>

<!-- <div class="sub-wrapper wk-pb-4 item wk-p-4 wk-p-lg-8 w-100 wk-rounded-top-start-lg-3xl"> -->
	{#each items as item, index}
		<div class="sub-item">
			<Toggle
				id="toggle"
				value="existing"
				bind:isToggled={item.isToggled}
				on:toggleChanged={(e) => handleToggleChanged(index, e.detail, date)}
			/>
			<h3>{item.name}</h3>
				<div>Begin Date: <strong>{date}</strong></div>
			
			
		</div>
		<div class="col-4 col-md-4">
			<Label for="expirationDate" class="form-Label fw-bold mb-2">*Expiration Date</Label>
			<Input id="expirationDate" type="date" name="expirationDate" class="form-control" />
		</div>
	{/each}
	<!-- <div class="col-6 col-md-6 wk-pb-4 wk-pb-md-0">
		<Label for="accountCreateExisting" class="form-Label fw-bold mb-2">{name}</Label>
		<div>Begin Date: <strong>{date}</strong></div>
	</div> -->


<!-- </div> -->

<style>
	.sub-wrapper {
		display: flex;
		justify-content: space-around;
	}
</style>
