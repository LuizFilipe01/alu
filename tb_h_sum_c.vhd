--
--
--

library ieee;
use std.textio.all;


entity tb_h_sum_c is 
end tb_h_sum_c;


architecture logic of tb_h_sum_c is

    component h_sum_c is port
    (
        data_in     :   in  bit_vector(2 downto 0);
        data_out    :   out bit_vector(1 downto 0)
    );
    end component;


    signal in_v :    bit_vector(2 downto 0);
    signal out_v:    bit_vector(1 downto 0);

    begin
        -- DUT --
        h_sum_01: h_sum_c port map(
        data_in  =>  in_v,
        data_out =>  out_v
        );

        process

            file stm     :   text open READ_MODE is "input_file.txt";
            file chk     :   text open READ_MODE is "check_out.txt";

            variable current_line_stm   :   line;
            variable row_stm            :   bit_vector(2 downto 0);

            variable current_line_chk   :   line;
            variable row_chk            :   bit_vector(1 downto 0);

            begin
                while(not endfile(stm)) loop
                    -- insert stimulus
                    readline(stm, current_line_stm);
                    read(current_line_stm, row_stm);
                    in_v <= row_stm;

                    -- compare results
                    readline(chk, current_line_chk);
                    read(current_line_chk, row_chk);
                    
                    wait for 10 ns;

                    if(row_chk /= out_v) then
                        report "Fail";
                        end if;

                end loop;
                wait;
            end process;

end logic;