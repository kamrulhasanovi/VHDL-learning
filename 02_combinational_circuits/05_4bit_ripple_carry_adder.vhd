
library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port (
        x, y, z : in std_logic;  -- z = carry in
        q       : out std_logic; -- sum output
        p       : out std_logic  -- carry output
    );
end full_adder;

architecture FA of full_adder is
begin
    q <= x xor y xor z;
    p <= (x and y) or ((x xor y) and z);
end FA;
---------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity Ripple_Adder is
    port (
        A    : in  std_logic_vector(3 downto 0);
        B    : in  std_logic_vector(3 downto 0);
        Cin  : in  std_logic;
        S    : out std_logic_vector(3 downto 0);
        Cout : out std_logic
    );
end Ripple_Adder;

architecture behv of Ripple_Adder is

    signal C : std_logic_vector(4 downto 0);

begin

    C(0) <= Cin;

    FA0: entity work.full_adder(FA)
        port map (
            x => A(0),
            y => B(0),
            z => C(0),
            q => S(0),
            p => C(1)
        );

    FA1: entity work.full_adder(FA)
        port map (
            x => A(1),
            y => B(1),
            z => C(1),
            q => S(1),
            p => C(2)
        );

    FA2: entity work.full_adder(FA)
        port map (
            x => A(2),
            y => B(2),
            z => C(2),
            q => S(2),
            p => C(3)
        );

    FA3: entity work.full_adder(FA)
        port map (
            x => A(3),
            y => B(3),
            z => C(3),
            q => S(3),
            p => C(4)
        );

    Cout <= C(4);

end behv;
