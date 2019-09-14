% function dzdt = projectile(t, z)
%
function dzdt = projectile(t, z)
    k = 0.1;
    g = 9.81;
   
    dzdt = [ z(3); z(4); -k * z(3); - g - k * z(4)];
end