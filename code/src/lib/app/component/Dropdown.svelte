<script lang="ts">
	import data from "../../../lib/app/server/data.json"
	export let selectedItemDropdown: string| undefined
		export let value: boolean | string | undefined;

	const selectedItem = (e: any) => {
     selectedItemDropdown = e.target.value
  };

  $: selectedItemDropdown;

</script>

<select bind:value={value} on:change={selectedItem} aria-expanded="false" class="bg-transparent border border-1 btn px-3 py-2 rounded-3 text-start wk-cursor-pointer">

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

select {

  -webkit-appearance: none;
  -moz-appearance: none;
  background: transparent;
  background-image: url("../imgs/chevron-down-outline.png");
  background-repeat: no-repeat;
    background-position-x: 98%;
    background-position-y: 15px;
  border: 1px solid #dfdfdf;
  border-radius: 2px;
  margin-right: 2rem;
  padding: 1rem;
  padding-right: 2rem;

}



</style>