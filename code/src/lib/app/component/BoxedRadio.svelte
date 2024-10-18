<script lang="ts">
	export let id: string;
	export let name: string;
	export let value:  string 
	export let disabled: boolean = false;
	export let group: string | number | undefined = undefined;
	export let checked: boolean = false;
	export let flexGrow: boolean = false;
	export let selected: string | boolean | undefined
	export let companyType: string | undefined

	$: checked = group !== undefined ? group === value : checked;
	$: selected = '';
	$: companyType= 'new';


	const selectOption = (value: string, id: string) => {
    selected = value; 
  };

</script>

{#if companyType === ''}
<label
	for={id}
	class="bg-transparent border border-1 btn px-3 py-2 rounded-3 text-start wk-cursor-pointer {selected !== value ? 'wk-theme-shadow-glow' : 'wk-theme-border-main'}"
	class:flex-grow-1={flexGrow}>



	<div class="form-check" >
		<input required {checked} {name} {disabled}{value} bind:group={selected}   on:click={() => selectOption(value, id)} type="radio" class="form-check-input me-1 " />
		<span class="form-check-label"><slot /></span>
	</div>
</label>
{/if}
{#if companyType }
<label
	for={id}
	class="bg-transparent border border-1 btn px-3 py-2 rounded-3 text-start wk-cursor-pointer {companyType !== value ? 'wk-theme-shadow-glow' : 'wk-theme-border-main'}"
	class:flex-grow-1={flexGrow}

>

	<div class="form-check" >
		<input required {checked} {name} {disabled}{value} bind:group={companyType}   on:click={() => selectOption(value, id)} type="radio" class="form-check-input me-1 " />
		<span class="form-check-label"><slot /></span>
	</div>
</label>

{/if}