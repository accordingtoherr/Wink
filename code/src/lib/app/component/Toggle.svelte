<script lang="ts">
	import { createEventDispatcher } from 'svelte';

	export let id: string;
	export let value: boolean | string | undefined;
	export let group: string | number | undefined = undefined;
	export let checked: boolean = false;
	export let flexGrow: boolean = false;
	export let isToggled: boolean = false;

	$: checked = group !== undefined ? group === value : checked;

	const dispatch = createEventDispatcher<{ toggleChanged: boolean }>();

	function handleToggle() {
		isToggled = !isToggled;
		dispatch('toggleChanged', isToggled);
	}
</script>

<label
	for={id}
	class:flex-grow-1={flexGrow}
	class:wk-theme-border-main={checked}
	class:wk-theme-shadow-glow={checked}
>
	<label class="switch">
		<input
			aria-checked="false"
			tabindex="0"
			bind:checked={isToggled}
			on:click={handleToggle}
			type="checkbox"
		/>
		<span class="slider round"></span>
	</label>
</label>

<style>
	.switch {
		position: relative;
		display: inline-block;
		width: 60px;
		height: 34px;
	}

	/* Hide default HTML checkbox */
	.switch input {
		opacity: 0;
		width: 0;
		height: 0;
	}

	/* The slider */
	.slider {
		position: absolute;
		cursor: pointer;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background-color: #ccc;
		-webkit-transition: 0.4s;
		transition: 0.4s;
	}

	.slider:before {
		position: absolute;
		content: '';
		height: 26px;
		width: 26px;
		left: 4px;
		bottom: 4px;
		background-color: white;
		-webkit-transition: 0.4s;
		transition: 0.4s;
	}

	input:checked + .slider:before {
		-webkit-transform: translateX(26px);
		-ms-transform: translateX(26px);
		transform: translateX(26px);
	}

	/* Rounded sliders */
	.slider.round {
		border-radius: 34px;
	}

	.slider.round:before {
		border-radius: 50%;
	}
</style>
