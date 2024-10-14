<script lang="ts">
	export let id: string;
	export let name: string;
	export let value: boolean | string | undefined;
	export let disabled: boolean = false;
	export let group: string | number | undefined = undefined;
	export let checked: boolean = false;
	export let flexGrow: boolean = false;
	export let selected: string | undefined

	$: checked = group !== undefined ? group === value : checked;

	$: selected = '';
	console.log('ch', checked)

</script>

<label
	for={id}
	class="bg-transparent border border-1 btn px-3 py-2 rounded-3 text-start wk-cursor-pointer"
	class:flex-grow-1={flexGrow}
	class:wk-theme-border-main={checked}
	class:wk-theme-shadow-glow={!checked}
>
	<div class="form-check">
		<input required {checked} {id} {name} {value}{disabled} bind:group={checked} type="radio" class="form-check-input me-1" />
		<span class="form-check-label"><slot /></span>
	</div>
</label>
