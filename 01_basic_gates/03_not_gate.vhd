library ieee;
use ieee.std_logic_1164.all;

entity not_gate is
	port(
	a : in std_logic;
	y : out std_logic
	);
end not_gate;

architecture rtl of not_gate is
  begin
    process (a)
begin
	y <= not a ;
	  end process;
	end rtl;
