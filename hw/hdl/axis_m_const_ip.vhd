
library IEEE;
use IEEE.std_logic_1164.all;

entity axis_m_const_ip is
Port ( 
	clock   : in  std_logic;
	reset   : in  std_logic;  
	-- axi master streaming interface
	valid_o : out std_logic;
	ready_i : in  std_logic;
	data_o  : out std_logic_vector(31 downto 0)
);
end axis_m_const_ip;

architecture Behavioral of axis_m_const_ip is
begin

valid_o <= '0';
data_o  <= (others => '0');

end architecture;