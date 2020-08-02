library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blink_button is
    Port ( clock : in  STD_LOGIC;
           button : in  STD_LOGIC;
           led : out  STD_LOGIC);
end blink_button;

architecture Behavioral of blink_button is
begin
led <= button;
end Behavioral;

