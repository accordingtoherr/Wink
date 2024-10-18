<script lang="ts">
	export let id: string;
	export let name: string;
	export let value: boolean | string | undefined;
	export let disabled: boolean = false;
	export let group: string | number | undefined = undefined;
	export let checked: boolean = false;
	export let flexGrow: boolean = false;

	//made a new var since checked needs to be boolean and i need
	export let selected: boolean | string | undefined

	$: checked = group !== undefined ? group === value : checked;
  console.log

</script>

<label
	for={id}
	class:flex-grow-1={flexGrow}
	class:wk-theme-border-main={checked}
	class:wk-theme-shadow-glow={checked}
>
<label class="switch" >
	<input
   aria-checked=false
    tabindex="0" 
    type="checkbox">
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
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
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