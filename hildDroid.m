function [out] = hildDroid(self, enemy, tank, mine)
% function [out] = hildDroidv1(self, enemy, tank, mine) is the first
% version of hildDroid, designed to be effective against gsiBot. It is an
% experimental, proof-of-concept prototype.
% Designed by Andrew Hild at HildFoundry South, 03/23/2014

% Set up speed constants for the droid. Pedal to the metal.
params.speed_game=2.5;
params.speed_terminate=3.0;

% If there are still fuel tanks in the field, do this...
if ~isempty(tank)
    % Find the closest tank
    target=tank(min(norm(tank.pos-self.pos)));
    dx=(params.speed_game/norm(target.pos-self.pos))*(target.pos(1)-self.pos(1));
    dy=(params.speed_game/norm(target.pos-self.pos))*(target.pos(2)-self.pos(2));
    out=[dx, dy];
else
    % Nail the enemy
    dx=(params.speed_terminate/norm(enemy.pos-self.pos))*(enemy.pos(1)-self.pos(1));
    dy=(params.speed_terminate/norm(enemy.pos-self.pos))*(enemy.pos(2)-self.pos(2));
    out=[dx, dy];
end
end