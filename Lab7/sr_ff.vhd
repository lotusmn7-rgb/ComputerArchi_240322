library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_FF is
    port (
        CLK : in  std_logic;
        S   : in  std_logic;
        R   : in  std_logic;
        Q   : out std_logic;
        QB  : out std_logic   -- Q complement
    );
end entity SR_FF;

architecture Behavioral of SR_FF is
    signal Q_int : std_logic := '0'; -- Internal signal initialized to '0'
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if S = '0' and R = '0' then 
                null;                   -- Hold state (no change)
            elsif S = '0' and R = '1' then 
                Q_int <= '0';           -- Reset state
            elsif S = '1' and R = '0' then 
                Q_int <= '1';           -- Set state
            -- S=1, R=1 is forbidden: no assignment is made, keeping the previous value
            end if;
        end if;
    end process;

    -- Concurrent assignments for outputs
    Q  <= Q_int;
    QB <= not Q_int;

end architecture Behavioral;