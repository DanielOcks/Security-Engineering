package body Math is
    Procedure S(X: in out Natural; Y: in out Natural)
     with Pre => (X > 0 or X = 0) and (Y > 0 or Y = 0),
          Post => X = Y'Old and Y = X'Old;
    begin --def(X,Y)
        X := Natural(Unsigned(X) xor Unsigned(Y)); --c-use(X,Y), def(X)
        Y := Natural(Unsigned(X) xor Unsigned(Y)); --c-use(X,Y), def(Y)
        X := Natural(Unsigned(X) xor Unsigned(Y)); --c-use(X,Y), def(X)
    end S;

    Procedure T(X: in out Natural; Y: in out Natural; Z: in out Natural)
     with Pre => (X > 0 or X = 0) and (Y > 0 or Y = 0) and (Z > 0 or Z = 0),
          Post => (X < Y or X = Y) and (X < Z or X = Z) and
                  (Y > X or Y = X) and (Y < Z or Y = Z) and
                  (Z > X or Z = X) and (Z > Y or Z = Y) ;
    begin --def(X,Y,Z)
        if X > Y then --p-use(X,Y)
            S(X, Y); --c-use(X,Y)
        end if;

        if Y > Z then --p-use(Y,Z)
            S(Y, Z); --c-use(Y,Z)
        end if;

        if X > Y then --p-use(X,Y)
            S(X, Y); --c-use(X,Y)
        end if;
   end T;
end package;
