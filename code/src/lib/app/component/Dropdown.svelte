<script lang="ts">
	import data from "../../../lib/app/server/data.json"

	export let id: string;
	// export let name: string;
let selectedOption = ''
	// export let group: string | number | undefined = undefined;

	//made a new var since checked needs to be boolean and i need
	export let selected: boolean | string | undefined
	let selectedItemDropdown = ''

	const selectedItem = (e: any) => {
     selectedItemDropdown = e.target.value
  };

  $: selectedItemDropdown;

  console.log('s', selectedItemDropdown)

</script>

<select on:change={selectedItem} aria-expanded="false" class="bg-transparent border border-1 btn px-3 py-2 rounded-3 text-start wk-cursor-pointer">
	<option value=""></option>
	{#each data as d}
		<option>
			{d.name}
		</option>
	{/each}
</select>
<style>
select:hover {
	cursor: pointer;
}

</style>