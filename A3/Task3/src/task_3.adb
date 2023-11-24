package body Task_3 is

   function F(N: Natural) return Natural is
    I: Natural := 0;
    X: Natural := 1;
   begin --def(N)
    while I < N loop --def(I), p-use(I), c-use(N)
        I := I + 1;  --def(I), c-use(I)
        X := X * I; --def(X), c-use(X, I)
    end loop;

    return X; -- c-use(X)
   end F;
   
   function G(N: Natural; K: Natural) return Natural is
    X: Natural; 
    Y: Natural; 
    Z: Natural; 
   begin
    X := F(K);
    Y := F(N-K);
    Z := F(N);
    return Z / (X * Y);
   end G;
   

end Task_3;
