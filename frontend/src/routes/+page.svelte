<script lang="ts">
	import { ethers } from 'ethers';
	import { Plug, Plus, Award } from 'lucide-svelte';
	import { Button } from '$lib/components/ui/button/index.js';
	import * as Card from '$lib/components/ui/card/index.js';
	import { Input } from '$lib/components/ui/input/index.js';
	import { Label } from '$lib/components/ui/label/index.js';
	import { Badge } from '$lib/components/ui/badge/index.js';
	import * as Alert from '$lib/components/ui/alert/index.js';
	import * as utils from './utils.js';

	let { data } = $props();
	const MAIN_CONTRACT_ADDR = '0x00FeB6633c6B230D76D2B15b6eF8b679b0634cD3';
	let provider;
	let signer;
	let address = $state('');
	let contract;
	let show = $state(false);
	let milestones = $state(0n);

	async function connectToMetaMask() {
		if (typeof window.ethereum !== 'undefined') {
			try {
				address = (await window.ethereum.request({ method: 'eth_requestAccounts' }))[0];
				provider = new ethers.BrowserProvider(window.ethereum);
				signer = await provider.getSigner();
				contract = new ethers.Contract(MAIN_CONTRACT_ADDR, data.abi, signer);
				milestones = await contract.milestones(address);
			} catch (e) {
				console.error(e);
				alert('User denied account access or there was an issue.');
			}
			show = true;
		} else {
			alert('MetaMask is not installed. Please install it to use this feature.');
		}
	}

	function add() {
		utils
			.getMilestone(address, contract)
			.then((e) => {
				utils
					.setMilestone(address, e + 1n, contract)
					.then((e) => (milestones += 1n))
					.catch(console.error);
			})
			.catch(console.error);
	}
</script>

<Card.Root class="w-[350px] m-auto mt-20">
	<Card.Header>
		<Card.Title>leafield</Card.Title>
		<Card.Description>Take a look at your achievements!</Card.Description>
	</Card.Header>
	<Card.Content>
		<form>
			<div class="grid w-full items-center gap-4">
				<div class="flex flex-col space-y-1.5">
					<Label for="aid">Achievement ID:</Label>
					<Input id="aid" placeholder="!@#$%^&*" />
				</div>
			</div>
		</form>
	</Card.Content>
	<Card.Footer class="flex justify-between">
		{#if !address}
			<Button onclick={connectToMetaMask}>
				<Plug class="mr-[0.23rem]" />
				Connect
			</Button>
		{:else}
			<Badge>Wallet connected</Badge>
		{/if}
		<Button variant="secondary" onclick={add}>
			<Plus class="mr-[0.23rem]" />
			Add
		</Button>
	</Card.Footer>
</Card.Root>

{#if show}
	<Alert.Root class="m-auto mt-5 w-[21.8rem]">
		<Award class="h-4 w-4" />
		<Alert.Title>Whats in for me?</Alert.Title>
		<Alert.Description>You have a total of {milestones} achievements!</Alert.Description>
	</Alert.Root>
{/if}
