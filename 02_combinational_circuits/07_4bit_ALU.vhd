
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu4bit is
    port (
        a, b : in  std_logic_vector(3 downto 0);
        sel  : in  std_logic_vector(2 downto 0);
        y    : out std_logic_vector(3 downto 0);
        cout : out std_logic
    );
end alu4bit;

architecture rtl of alu4bit is
begin
    process(a, b, sel)
        variable result_ext : unsigned(4 downto 0);
    begin
        y    <= "0000";
        cout <= '0';

        case sel is
            when "000" =>
                result_ext := ('0' & unsigned(a)) +
                              ('0' & unsigned(b));

                y    <= std_logic_vector(result_ext(3 downto 0));
                cout <= result_ext(4);

            when "001" =>
                y <= std_logic_vector(unsigned(a) - unsigned(b));

            when "010" =>
                y <= a and b;

            when "011" =>
                y <= a xor b;

            when others =>
                y    <= "0000";
                cout <= '0';

        end case;
    end process;
end rtl;
```
