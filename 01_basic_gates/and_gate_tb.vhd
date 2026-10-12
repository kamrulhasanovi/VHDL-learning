library ieee;
use ieee.std_logic_1164.all;  


entity and_gate_tb is 
end and_gate_tb;

architecture behaviour of and_gate_tb is

component and_gate
port (
	a : in std_logic;
	b : in std_logic;
	y : out std_logic
	);
end component;

signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal y : std_logic;
begin
-- Instantiate DUT
   uut: and_gate
        port map (
            a => a,
            b => b,
            y => y
        );

-- Stimulus process
    stim_proc: process
    begin
        a <= '0'; b <= '0';
        wait for 10 ns;

        a <= '0'; b <= '1';
        wait for 10 ns;

        a <= '1'; b <= '0';
        wait for 10 ns;

        a <= '1'; b <= '1';
        wait for 10 ns;

wait; -- stop simulation
    end process;

end behaviour;

