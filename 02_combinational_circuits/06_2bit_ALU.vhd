library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu2bit is
    port (
        A    : in  std_logic_vector(1 downto 0);
        B    : in  std_logic_vector(1 downto 0);
        sel  : in  std_logic_vector(1 downto 0);
        Y    : out std_logic_vector(1 downto 0);
        Cout : out std_logic
    );
end alu2bit;

architecture rtl of alu2bit is
    signal result_ext : unsigned(2 downto 0);
begin

    process (A, B, sel)
    begin
        Y    <= "00";
        Cout <= '0';

        case sel is

            when "00" =>
                result_ext :=
                    ('0' & unsigned(A)) +
                    ('0' & unsigned(B));

                Y    <= std_logic_vector(result_ext(1 downto 0));
                Cout <= result_ext(2);

            when "01" =>
                Y <= std_logic_vector(
                    unsigned(A) - unsigned(B)
                );

            when "10" =>
                Y <= A and B;

            when "11" =>
                Y <= A xor B;

            when others =>
                Y    <= "00";
                Cout <= '0';

        end case;
    end process;

end rtl;
