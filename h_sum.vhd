--
--
--

entity h_sum is port
(
    A   :   in  bit;
    B   :   in  bit;
   Ci   :   in  bit;
    S   :  out  bit; 
   Co   :  out  bit 
);

end h_sum;


architecture logic of h_sum is

begin
    S <= A XOR B XOR Ci;
   Co <= A AND B; 
end logic;