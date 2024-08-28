export const load = async ({ fetch }) => {
	const response = await fetch('/abi.json');

	if (!response.ok) {
		throw new Error('Failed to load abi.json');
	}

	const abi = await response.json();

	return {
		abi
	};
};
