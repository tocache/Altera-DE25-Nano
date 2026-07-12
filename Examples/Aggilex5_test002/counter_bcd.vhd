library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity counter_bcd is
	port(	in_clk:	in std_logic;
			seg:		out std_logic_vector(6 downto 0));
end counter_bcd;

architecture funcionamiento of counter_bcd is

signal cuenta_div:	std_logic_vector(25 downto 0);
signal interno: std_logic;
signal cuenta: std_logic_vector(3 downto 0);

begin
	process(in_clk)
	begin
		if rising_edge(in_clk) then
			if cuenta_div = 25000000 then
				cuenta_div <= (others => '0');
				interno <= not interno;
			else
				cuenta_div <= cuenta_div + 1;
			end if;
		end if;
	end process;
	
	process(interno)
	begin
		if rising_edge(interno) then
			if cuenta = 9 then
				cuenta <= (others => '0');
			else
				cuenta <= cuenta + 1;
			end if;
		end if;
	end process;
	with cuenta select
			seg <=	"0111111" when "0000",
						"0000110" when "0001",
						"1011011" when "0010",
						"1001111" when "0011",
						"1100110" when "0100",
						"1101101" when "0101",
						"1111101" when "0110",
						"0000111" when "0111",
						"1111111" when "1000",
						"1100111" when "1001",
						"ZZZZZZZ" when others;
end funcionamiento;

			