library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- interface description - how does this unit look from the outside
entity blink1 is
    Port ( clock : in  STD_LOGIC;
           led : out  STD_LOGIC);
end blink1;

-- implementation of the module
architecture Behavioral of blink1 is
constant counter_limit : integer := 5000000; --counter limit before blink
signal counter : unsigned (24 downto 0); -- 25 bit counter (going to 33M)
signal blink : STD_LOGIC; --internal signal to remember LED output state
begin

-- process to run on every clock cycle
process(clock)
	begin
		if rising_edge(clock) then
			if counter = counter_limit then
				counter <= (others => '0'); --reset the counter
				blink <= not blink; --flip the blink signal
			else
				counter <= counter + 1; --increment the counter
			end if;
		end if;
	end process;
		
-- asynchronous assignment
led <= blink;

end Behavioral;