<script lang="ts">
	import { Input, Label } from "@sveltestrap/sveltestrap";
	import Toggle from "./Toggle.svelte";

	export let name: string;
	export let value: boolean | string | undefined;
	export let group: string | number | undefined = undefined;
	export let checked: boolean = false;

	//made a new var since checked needs to be boolean and i need
	export let selected:string | boolean | undefined

	$: checked = group !== undefined ? group === value : checked;

	//use Date obj to grab current date and format, since a user would be a new user getting a subscription that should start when they purchase/sign up//
	let date = new Date().toLocaleString('en-us',{day: 'numeric', month:'short', year:'numeric'})

</script>
<div class="sub-wrapper wk-pb-4 item wk-p-4 wk-p-lg-8 w-100  wk-rounded-top-start-lg-3xl">
	<div class="col-6 col-md-6 wk-pb-4 wk-pb-md-0">
		<Label for="toggle" class="form-Label fw-bold mb-2"></Label>
		<Toggle
		id="toggle"
		name=name
		selected
		value="existing"
		bind:checked
		/>
		<Label for="accountCreateExisting" class="form-Label fw-bold mb-2">{name}</Label>
		<div>Begin Date: <strong>{date}</strong></div>
	</div>

	<div class="col-4 col-md-4">
		<Label for="expirationDate" class="form-Label fw-bold mb-2">*Expiration Date</Label>
		<Input id="expirationDate"  type="date" name="expirationDate"  class="form-control" />
	</div>
</div>

<style>
	.sub-wrapper {
    display: flex;
    justify-content: space-around;
}
</style>