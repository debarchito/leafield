export async function getMilestone(userAddress, contract) {
	try {
		return await contract.milestones(userAddress);
	} catch (error) {
		console.error('Error fetching milestone:', error);
	}
}

export async function setMilestone(userAddress, milestone, contract) {
	try {
		const tx = await contract.setMilestone(userAddress, milestone);
		await tx.wait();
		console.log(`Milestone set for ${userAddress} with milestone: ${milestone}`);
	} catch (error) {
		console.error('Error setting milestone:', error);
	}
}
