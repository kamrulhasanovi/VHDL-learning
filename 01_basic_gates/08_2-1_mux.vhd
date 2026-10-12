
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mux is

port (
a : in std_logic;
b : in std_logic;
sel : in std_logic;
y : out std_logic
);

end mux;

architecture behv of mux is
begin
    y <= a when sel = '0' else b;

end behv;
