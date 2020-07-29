-- module used to connect to the unused slave Hermes router ports so that they are not optmized 
library IEEE;
use IEEE.std_logic_1164.all;

entity axis_m_const is
Port ( 
	clock   : in  std_logic;
	reset   : in  std_logic;  
	-- axi master streaming interface
	valid_o : out std_logic;
	ready_i : in  std_logic;
	data_o  : out std_logic_vector(31 downto 0)
);
end axis_m_const;

architecture Behavioral of axis_m_const is

signal data_s : std_logic_vector(31 downto 0);
signal valid_s : std_logic;
signal ready_s : std_logic;

attribute dont_touch : string;
attribute dont_touch of data_s : signal is "true";

attribute dont_touch : string;
attribute dont_touch of valid_s : signal is "true";

attribute dont_touch : string;
attribute dont_touch of ready_s : signal is "true";

begin

process(clock)
begin
	if rising_edge(clock) then
		data_s <= (others => '0');
		valid_s <= '0';
		ready_s <= ready_i;
	end if;
end process;

valid_o <= valid_s;
data_o  <= data_s;

end architecture;