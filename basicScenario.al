Formal Action Description: 

Objects:
========
battery
connectionState = {connected, badly_connected, disconnected}
Steps = {1..N}


Variables:
==========
C = connectionState
T = steps


Fluents:
========
chargeLevel(battery) %numerical fluent 
ok(battery) % abducable
charging(battery) %Can’t begin charging if this is true
in_state(C) 
misaligned(battery) % abducable

start(T) %Time that step T started
end(T) %Time that step T ended
 

State constraints:
=================
-in_state(C2) if in_state(C1), C1!=C2


Actions:
==========

charge(battery)%not really an action
start(charge(battery))
end(charge(battery))
insert(battery)
remove(battery)
fail(battery)
repair(battery)
bump(robot)

%% Durative action charge

charge(battery)(t1) causes chargeLevel(battery)(t2) = chargeLevel(battery)(t1) + F(chargeLevel(battery)(t1), start(t1), end(t1), start(t2), end(t2)) if state(connected), ok(battery)
charge(battery)(t1) causes chargeLevel(battery)(t2) < chargeLevel(battery)(t1) + F(chargeLevel(battery)(t1), start(t1), end(t1), start(t2), end(t2)) if state(badly_connected), ok(battery)
charge(battery)(t1) causes UNKNOWN(chargeLevel(battery)) if state(connected), -ok(battery)

%% Check if durative actions are only in one state in the H paper.

start(charge(battery)) causes charging(battery) if -state(disconnected), -charging(battery)
start(charge(battery)) impossible if state(disconnected)
start(charge(battery)) impossible if charging(battery)

end(charge(battery)) causes -charging(battery) 
end(charge(battery)) impossible if -charging(battery)

insert(battery) causes state(connected) if -misaligned(robot)
insert(battery) causes state(badly_connected) if misaligned(robot) 
insert(battery) impossible if -state(disconnected)
 
remove(battery) causes state(disconnected)
remove(battery) causes -misaligned(battery)
remove(battery) impossible if state(disconnected)

fail(battery) causes -ok(battery) 

repair(battery) causes ok(battery) 
repair(battery) impossible if ok(battery)

bump(robot) causes misaligned(battery)
 
