----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:42:02 08/02/2020 
-- Design Name: 
-- Module Name:    top_module - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_module is
    Port ( clock : in  STD_LOGIC;
	 LED      : OUT STD_LOGIC_VECTOR(2 downto 0);
	 Switch   : IN STD_LOGIC_VECTOR(2 downto 0)
	 );
end top_module;

architecture Behavioral of top_module is

	COMPONENT blink1
	PORT(
		clock : IN std_logic;          
		led : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT blink_button
	PORT(
		clock : IN std_logic;
		button : IN std_logic;          
		led : OUT std_logic
		);
	END COMPONENT;
	
	signal button1and2 : STD_LOGIC;

begin
	Inst_blink1: blink1 PORT MAP(
		clock => clock,
		led => LED(0)
	);
	
	Inst_blink_button1: blink_button PORT MAP(
		clock => clock,
		button => not Switch(0),
		led => LED(1)
	);
	
	Inst_blink_button2: blink_button PORT MAP(
		clock => clock,
		button => button1and2,
		led => LED(2)
	);
	
	button1and2 <= Switch(1) nor Switch(2);

end Behavioral;

