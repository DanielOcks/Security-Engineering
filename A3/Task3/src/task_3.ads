package Task_3 is

   function Factorial(N: Natural) return Natural;


   function F(N: Natural) return Natural
     with Pre => N <= 12,
       Post => (F'Result < Natural'Last) and (F'Result = Factorial(N));

   function G(N: Natural; K: Natural) return Natural
     with Pre => K <= N,
     Post => (G'Result = F(N) / (F(K) * F(N-K))) and (G'Result < Natural'Last);

end Task_3;
