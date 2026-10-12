library ieee;
use ieee.std_logic_1164.all;

entity full_subtractor is
    port(
        a, b, bin : in std_logic;
        diff, bout : out std_logic
    );
end full_subtractor;

architecture behv of full_subtractor is
begin

    diff <= a xor b xor bin;

    bout <= ((not a) and b) or
            ((not (a xor b)) and bin);

end behv;
