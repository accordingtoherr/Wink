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

	{#each items as item, index}
		<div class="{item.name === 'AnnuitySpecs' ? 'sub-item annuity wk-rounded wk-shadow-lg ' : 'sub-item wk-rounded wk-shadow-lg '}">
			<Toggle
				id="toggle"
				value="existing"
				bind:isToggled={item.isToggled}
				on:toggleChanged={(e) => handleToggleChanged(index, e.detail, date)}
			/>
			<div class="name">
			<h4>{item.name}</h4>
				<div>Begin Date: <strong>{date}</strong></div>
			</div>
		<div class="col-4 col-md-4 expire">
			<Label for="expirationDate" class="form-Label fw-bold mb-2">*Expiration Date</Label>
			<Input id="expirationDate" type="date" name="expirationDate" class="form-control" />
		</div>
	</div>

	{/each}

<style>
 .sub-item {
	width: 80%;
    margin-top: 1rem;
    display: flex;
    gap: 2rem;
	padding:5px;
	border-radius:25px;
 }

 .sub-item.annuity {
	background-color:#F4EEFB
 }

 .sub-item .name {
    text-align: left;
    width: 100%;
}

.sub-item h3 {
	text-align: left;
}

 .expire {
	display: flex;
    flex-direction: column;
    width: 10rem;
 }


</style>
