<script lang="ts">
	import { Input, Label } from "@sveltestrap/sveltestrap";
	import Toggle from "./Toggle.svelte";

	export let name: string;
	export let value: boolean | string | undefined;
	export let group: string | number | undefined = undefined;
	export let checked: boolean = false;

	//made a new var since checked needs to be boolean and i need
	export let selected: boolean | string | undefined

	$: checked = group !== undefined ? group === value : checked;

	//use Date obj to grab current date and format, since a user would be a new user getting a subscription that should start when they purchase/sign up//
	let date = new Date().toLocaleString('en-us',{day: 'numeric', month:'short', year:'numeric'})

</script>

<div class="row wk-pb-4">
	<div class="col-12 col-md-6 wk-pb-4 wk-pb-md-0">
		<Label for="toggle" class="form-Label fw-bold mb-2"></Label>
		<Toggle
		{selected}
		id="toggle"
		name=name
		value="existing"
		bind:checked
		/>
		<Label for="accountCreateExisting" class="form-Label fw-bold mb-2">{name}</Label>
		<div>Begin Date: <strong>{date}</strong></div>
	</div>

	<div class="col-12 col-md-6">
		<Label for="expirationDate" class="form-Label fw-bold mb-2">*Expiration Date</Label>
		<Input id="expirationDate"  type="date" name="expirationDate"  class="form-control" />
	</div>
</div>