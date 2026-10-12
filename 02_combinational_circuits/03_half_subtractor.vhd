library ieee;
use ieee.std_logic_1164.all;

entity half_subtractor is
    port(
        a, b  : in std_logic;
        diff  : out std_logic;
        bout  : out std_logic
    );
end half_subtractor;

architecture behv of half_subtractor is
begin

    diff <= a xor b;
    bout <= (not a) and b;

end behv;
