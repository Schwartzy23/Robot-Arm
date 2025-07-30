clear; clc; close all;

%Define End Effector Parameters

y = 100;
phi = 0;


% Define Robot Specs
l1 = 130;
l2 = 132.3;
l3 = 55;


%Solution 1
for t=1:200
    O2a(t) = acosd((t^2 + y^2 - l1^2 - l2^2)/(2*l1*l2));
    
    O1a(t) = atand(y/t) - atand(l2*sind(O2a(t))/(l1+l2*cosd(O2a(t))));

    O3a(t) = phi - O1a(t) - O2a(t);
end

%Solution 2
for t=1:200
    O2b(t) = -acosd((t^2 + y^2 - l1^2 - l2^2)/(2*l1*l2));
    
    O1b(t) = atand(y/t) - atand(l2*sind(O2b(t))/(l1+l2*cosd(O2b(t))));

    O3b(t) = phi - O1b(t) - O2b(t);
end

for t=1:200
    if O1a(t)<0
        O2 = O2b; O1 = O1b; O3 = O3b;
        break;
    elseif O1a(t)>0
        O2 = O1a; O1 = O1a; O3 = O3a;
    end
end


for t=1:200
    
    %Points
    Ax(t) = 0;
    Ay(t) = 0;
    
    Bx(t) = l1*cosd(O1(t));
    By(t) = l1*sind(O1(t));
    
    Cx(t) = Bx(t) + l2*cosd(O1(t)+O2(t));
    Cy(t) = By(t) + l2*sind(O1(t)+O2(t));
    
    Dx(t) = Cx(t) + l3*cosd(O1(t)+O2(t)+O3(t));
    Dy(t) = Cy(t) + l3*sind(O1(t)+O2(t)+O3(t));
    
    
    %%%% Plotting Linkage %%%%%
    plot( [Ax(t) Bx(t)], [Ay(t) By(t)], [Bx(t) Cx(t)], [By(t) Cy(t)], [Cx(t) Dx(t)], [Cy(t) Dy(t)], 'Linewidth', 3);
    hold on;
    grid on;
    axis equal;
    axis ([-50 400 -50 200]);
    drawnow;
    hold off;

end
