dc=0.001;renx=0;reny=8;
while (renx<=0)
    plot(renx,reny,'.');
    hold on;
    daorenx=-renx/(4*reny);daoreny=64;
    drenx=dc*daorenx/(daorenx^2+daoreny^2)^0.5;
    dreny=dc*daoreny/(daorenx^2+daoreny^2)^0.5;
    if (reny==0)
        reny=reny-dc
    end
    if (renx==0)
        renx=renx-dc
    end
    renx=renx-drenx;reny=reny-dreny;
end