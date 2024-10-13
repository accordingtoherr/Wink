<script lang="ts">
	import data from "../../../lib/app/server/data.json"
	export let selectedItemDropdown: string| undefined
		export let value: boolean | string | undefined;

	const selectedItem = (e: any) => {
     selectedItemDropdown = e.target.value
  };

  $: selectedItemDropdown;

</script>

<select {value} on:change={selectedItem} aria-expanded="false" class="bg-transparent border border-1 btn px-3 py-2 rounded-3 text-start wk-cursor-pointer">

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