library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
port(
	a, b, cin: in std_logic;
	s, c: out std_logic
);
end full_adder;

architecture behv of full_adder is
begin
 s <= a xor b xor cin;
 c <= (a and b) or ((a xor b) and cin) ;
end behv;
