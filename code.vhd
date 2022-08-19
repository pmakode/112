library ieee;
use ieee.std_logic_1164.all;
entity deland is
  port (
    X_in, Y_in : in std_logic;
    Z_out: out std_logic
    );
end entity deland;

architecture first of deland is
    begin
        Z_out <= X_in and Y_in after 100 ps;
end architecture first;



library ieee ;
use ieee.std_logic_1164.all;
entity delxor is
  port (
    X_in, Y_in : in std_logic;
    Z_out: out std_logic
    );
end entity delxor;

architecture second of delxor is
    begin
        g_out <= X_in xor Y_in after 100 ps;
end architecture second;


library ieee ;
use ieee.std_logic_1164.all;
entity orand is
  port (
    W_in, X_in, Y_in : in std_logic;
    Z_out: out std_logic
    );
end entity orand;

architecture third of orand is
    begin
        Z_out <= W_in or (X_in and Y_in) after 100 ps;
end architecture third;


--generate higher order g and p using port maps
library ieee ;
use ieee.std_logic_1164.all;
entity next_levelgp is
	port(
		g_low_1 : in std_logic;
		p_low_1 : in std_logic;
		g_low_2 : in std_logic;
		p_low_2 : in std_logic;
		g_up : out std_logic;
		p_up : out std_logic
	);
end next_levelgp;

architecture fourth of next_levelgp is
component deland is
  port (
    X_in, Y_in : in std_logic;
    Z_out: out std_logic
    );
end component deland;
for all deland use entity deland(first);

component orand is
  port (
    W_in, X_in, Y_in : in std_logic;
    Z_out: out std_logic
    );
end component orand;
for all orand use entity orand(third);


begin
	level1: deland
			port map(p_low_1,p_low_2,p_up);
	level2: orand
			port map(g_low_2,g_low_1,p_low_2,g_up);
end fourth;	







