trigger AccountTrigger on Account (before delete) {

    system.debug('new** '+trigger.new);
    system.debug('newmap** '+trigger.newmap);
    system.debug('old** '+trigger.old);
    system.debug('oldmap** '+trigger.oldmap);
}