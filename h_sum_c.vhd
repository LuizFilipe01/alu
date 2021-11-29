--
--  data_in(0) = A
--  data_in(1) = B
--  data_in(2) = Carry_in
--  data_out(1)= Soma
--  data_out(0)= Carry_out
--

entity h_sum_c is port
(
    data_in     :   in  bit_vector(2 downto 0);
    data_out    :   out bit_vector(1 downto 0)

);

end h_sum_c;


architecture logic of h_sum_c is 

    alias   A   :   bit is data_in(0);
    alias   B   :   bit is data_in(1);
    alias   C   :   bit is data_in(2);
    alias   S   :   bit is data_out(1);
    alias   Co  :   bit is data_out(0);

begin

    S  <=  A XOR B XOR C;
    Co <= (A OR C) AND (A OR B) AND (B OR C);

end logic;