trigger Opporuntiytrigger on Opportunity (after insert,after update)
{
		OpportunityTrigger.OpportunityUpdation(trigger.new);
}