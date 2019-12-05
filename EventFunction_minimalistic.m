function [value,isterminal,direction] = EventFunction_minimalistic(~,y)
%% [value,isterminal,direction] = EventFunction_minimalistic(~,y)
value = imag(y(1)); % Ground at y == 0
isterminal = true; % Stop if the hit the ground
direction = -1; % Should only be coming to the ground from above
end