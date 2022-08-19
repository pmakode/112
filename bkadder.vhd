library ieee;
use ieee.std_logic_1164.all;
library work;
use work.all

entity bkadder is
	port(
		a , b : in std_logic_vector((31) down to 0);
		cin : in std_logic;
		cout : out std_logic;
		sum : out std_logic_vector((31) down to 0));
end entity bkadder;

architecture simple of bkadder is
	
	signal g_1: std_logic_vector(31 downto 0);
	signal p_1: std_logic_vector(31 downto 0);
	
	signal g_2: std_logic_vector(15 downto 0);
	signal p_2: std_logic_vector(15 downto 0);
	
	signal g_3: std_logic_vector(7 downto 0);
	signal p_3: std_logic_vector(7 downto 0);
	
	signal g_4: std_logic_vector(3 downto 0);
	signal p_4: std_logic_vector(3 downto 0);
	
	signal g_5: std_logic_vector(1 downto 0);
	signal p_5: std_logic_vector(1 downto 0);
	
	signal cr: std_logic_vector(32 downto 0);
	
	signal g_6: std_logic;
	signal p_6: std_logic;

	component next_levelgp is
	port(
		g_low_1 : in std_logic;
		p_low_1 : in std_logic;
		g_low_2 : in std_logic;
		p_low_2 : in std_logic;
		g_up : out std_logic;
		p_up : out std_logic
	);
	end component next_levelgp;
for all next_levelgp use entity next_levelgp(fourth);
	component orand is
	  port (
	    W_in, X_in, Y_in : in std_logic;
	    Z_out: out std_logic
	    );
	end component orand;
	for all orand use entity orand(third);
begin


end architecture simple;
