
function DrawBezier(p, n)

    x1 = p(1);
    y1 = p(2);
    x2 = p(3);
    y2 = p(4);
    x3 = p(5);
    y3 = p(6);
    x4 = p(7);
    y4 = p(8);
    
    bx = 3*(x2-x1);
    cx = 3*(x3-x2) - bx;
    dx = x4-x1-bx-cx;
    
    by = 3*(y2-y1);
    cy = 3*(y3-y2) - by;
    dy = y4-y1-by-cy;
    
    t = linspace(0,1,n);
    
    x = x1 + bx*t + cx*t.^2 + dx*t.^3;
    y = y1 + by*t + cy*t.^2 + dy*t.^3;
    
    plot([x1 x4], [y1 y4], 'ro', [x1 x2], [y1 y2], 'r-', [x3 x4], [y3 y4], 'r-', x, y, '-');
    